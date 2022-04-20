import Foundation
import Combine
import web3swift
import BigInt
import PromiseKit
import AVFoundation

class Web3Manager {
    static let shared = Web3Manager()
    let web3 = try! Web3.new(URL(string: Endpoint.API.rpcUrl)!)
    
    enum PriceFeedType {
        case band
        case chainlink
    }
    
    func callSmartContract(
        contractAbi: String,
        contractAddress: EthereumAddress,
        function: String,
        params: [AnyObject] = [],
        extradata: Data = Data()
    ) -> Promise<[String : Any]>? {
        
        guard let contract = web3.contract(
            contractAbi,
            at: contractAddress,
            abiVersion: 2
        ) else {
            fatalError("Unable to get contract")
        }
        
        return contract
            .read(
                function,
                parameters: params,
                extraData: extradata
            )?
            .callPromise()
    }
    
    func getAccountValue(accountAddress: String, metadata: PerpMetadataAPIModel) -> Promise<[String : Any]>? {
        
        guard let contractAddress = metadata.contracts["ClearingHouse"]?.address else {
            print("Error getting clearing house contract")
            return nil
        }
        
        guard let clearingHouseEthAddress = EthereumAddress(contractAddress) else {
            print("Unable to get clearing house Eth address.")
            return nil
        }
        
        let promise = self.callSmartContract(
            contractAbi: ABI.Perp.clearingHouse,
            contractAddress: clearingHouseEthAddress,
            function: "getAccountValue",
            params: [accountAddress] as [AnyObject],
            extradata: Data()
        )
        
        
        return promise
    }
    
    func getIndexPrice(indexAddress: String) -> Promise<[String: Any]>? {
        
        guard let indexEthAddress = EthereumAddress(indexAddress) else {
            print("Unable to get price feed Eth address.")
            return nil
        }
        
        return self.callSmartContract(
            contractAbi: ABI.Perp.indexToken,
            contractAddress: indexEthAddress,
            function: "getIndexPrice",
            params: [0] as [AnyObject],
            extradata: Data()
        )
        
    }
    
    func getMarketPrice(priceFeedAddress: String, type: PriceFeedType) -> Promise<[String: Any]>? {
        
        guard let priceFeedEthAddress = EthereumAddress(priceFeedAddress) else {
            print("Unable to get price feed Eth address.")
            return nil
        }
        
        
        return self.callSmartContract(
            contractAbi: (type == .band) ? ABI.PriceFeed.band : ABI.PriceFeed.chainlink,
            contractAddress: priceFeedEthAddress,
            function: "getPrice",
            params: [0] as [AnyObject],
            extradata: Data()
        )
        
    }
    
    func getFreeCollateral(accountAddress: String, metadata: PerpMetadataAPIModel) -> Promise<[String : Any]>? {
        
        guard let contractAddress = metadata.contracts["Vault"]?.address else {
            print("Error getting Vault contract from metadata.")
            return nil
        }
        
        guard let vaultEthAddress = EthereumAddress(contractAddress) else {
            print("Unable to get vault Eth address.")
            return nil
        }
        
        return self.callSmartContract(
            contractAbi: ABI.Perp.vault,
            contractAddress: vaultEthAddress,
            function: "getFreeCollateral",
            params: [accountAddress] as [AnyObject],
            extradata: Data()
        )
    }
    
}
