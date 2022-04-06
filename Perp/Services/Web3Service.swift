import Foundation
import web3swift
import BigInt
import Alamofire

protocol Web3ServiceProtocol {
    func fetchAssetPrice(priceFeed: PriceFeed, completion: @escaping (Float?) -> Void)
    func fetchAccount(completion: @escaping (Account?) -> Void)
    func getAccountValue(completion: @escaping (Float?) -> Void)
}

final class Web3Service: Web3ServiceProtocol {
    
    var publicAddress: String = ""
    var perpMetadata: PerpMetadataAPIModel?
    let web3 = try! Web3.new(URL(string: Endpoint.API.rpcUrl)!)
    
    init(publicAddress: String = UserDefaults.standard.string(forKey: "publicAddress")!) {
        self.publicAddress = publicAddress
        fetchPerpMetadata()
    }
    
    private func fetchPerpMetadata() {
        let request = AF.request(Endpoint.API.perpMetadata)
        
        request.responseDecodable(of: PerpMetadataAPIModel.self) { (response) in
            guard let metadata = response.value else { return }

            self.perpMetadata = metadata
        }
    }
    
    func getAccountValue(completion: @escaping (Float?) -> Void) {
        DispatchQueue.global(qos: .background).async {
            guard let contractAddress = self.perpMetadata?.contracts["ClearingHouse"]?.address else {
                completion(nil)
                return
            }
            
            let contract = self.web3.contract(
                ABI.Perp.clearingHouse,
                at: EthereumAddress(contractAddress),
                abiVersion: 2)
            
            let accountValue = try? contract?.read(
                                    "getAccountValue",
                                    parameters: [EthereumAddress(self.publicAddress)] as [AnyObject],
                                    extraData: Data()
            )?.callPromise().wait()
            
            guard let isSuccess = accountValue?["_success"] as? Bool else {
                print("Unable to account value")
                completion(nil)
                return
            }
            
            if (isSuccess) {
                let valueInBigInt = accountValue?["0"].unsafelyUnwrapped as? BigUInt
                let divide = valueInBigInt?.quotientAndRemainder(dividingBy: BigUInt(10).power(6))
                let finalAccountValue = Float("\(divide?.quotient ?? 0).\(divide?.remainder ?? 0)")
                completion(finalAccountValue)
            } else {
                completion(nil)
            }

        }
    }
    
    func fetchAssetPrice(priceFeed: PriceFeed, completion: @escaping (Float?) -> Void) {
        DispatchQueue.global(qos: .background).async { [self] in
            let contract = web3.contract(
                priceFeed.feed == .chainlink ? ABI.PriceFeed.chainlink: ABI.PriceFeed.band,
                at: EthereumAddress(priceFeed.address.address),
                abiVersion: 2)!
            
            let currentPrice = contract.read("getPrice", parameters: [10] as [AnyObject], extraData: Data())
            let txnCurrentPrice = try! currentPrice!.callPromise().wait()
            
            let decimals = try! contract.read("decimals", parameters: [] as [AnyObject], extraData: Data())!.callPromise().wait()
            
            if ((txnCurrentPrice["_success"]!) as! Bool || decimals["_success"] as! Bool) {
                let value = txnCurrentPrice["0"].unsafelyUnwrapped as! BigUInt
                let decimal = decimals["0"].unsafelyUnwrapped as! BigUInt
                let divide = value.quotientAndRemainder(dividingBy: BigUInt(10).power(Int(decimal)))
                let price = "\(divide.quotient).\(divide.remainder)"
                completion(Float(price))
            } else {
                print("Error in fetchAssetPrice - \(priceFeed)")
            }
        }
        
    }
    
    func fetchAccount(completion: @escaping (Account?) -> Void) {
        DispatchQueue.global(qos: .background).async { [self] in
            let contract = web3.contract(
                ABI.Perp.vault,
                at: EthereumAddress(perpMetadata!.contracts["Vault"]!.address),
                abiVersion: 2)!
            
            let clearingHouse = web3.contract(
                ABI.Perp.clearingHouse,
                at: EthereumAddress(perpMetadata!.contracts["ClearingHouse"]!.address),
                abiVersion: 2)!
            
            let accountValue = try? clearingHouse.read("getAccountValue", parameters: [EthereumAddress(publicAddress)] as [AnyObject], extraData: Data())?.callPromise().wait()
            let accountFreeCollatral = try? contract.read("getFreeCollateral", parameters: [EthereumAddress(publicAddress)] as [AnyObject], extraData: Data())?.callPromise().wait()
            
            if(accountValue!["_success"]! as! Bool && accountFreeCollatral!["_success"]! as! Bool) {
                let accountValueBInt = accountValue!["0"].unsafelyUnwrapped as? BigUInt ?? BigUInt(0)
                let accountFreeCollatBInt = accountFreeCollatral?["0"].unsafelyUnwrapped as? BigUInt ?? BigUInt(0)

                let divideAccountValue = accountValueBInt.quotientAndRemainder(dividingBy: BigUInt(10).power(Int(6)))
                let divideFreeCollat = accountFreeCollatBInt.quotientAndRemainder(dividingBy: BigUInt(BigUInt(10).power(Int(6))))
                
                let finalAccValue = Float("\(divideAccountValue.quotient).\(divideAccountValue.remainder)")
                let finalAccFreeCollat = Float("\(divideFreeCollat.quotient).\(divideFreeCollat.remainder)")!
                
                completion(
                    Account(
                        accountValue: finalAccValue,
                        freeCollatral: finalAccFreeCollat,
                        address: publicAddress
                    )
                )
                
            } else {
                print("Error in fetchAccount.")
            }
        }
        
    }

}
