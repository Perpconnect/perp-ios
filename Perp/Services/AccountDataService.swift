import Foundation
import Combine
import web3swift
import BigInt

class AccountDataService {
    
    @Published var accountValue: Double = 0.0
    @Published var freeCollateral: Double = 0.0
    
    let metadata: PerpMetadataAPIModel
    let publicAddress = UserDefaults.standard.string(forKey: "publicAddress") ?? "0x0000000000000000000000000000000000000000"
    
    init(metadata: PerpMetadataAPIModel) {
        self.metadata = metadata
        
        getAccountValue()
        getFreeCollateral()
    }
    
    func getAccountValue() {
        Web3Manager.shared
            .getAccountValue(accountAddress: publicAddress, metadata: metadata)?
            .done { response in
                
                guard let valueResponse = response["_success"] as? Bool else {
                    print("Didnt get any response \(response)")
                    return
                }
                
                guard let accountValue = response["0"].underlying as? BigInt else {
                    print("Unable to unwrap account value \(response)")
                    return
                }
                
                if (valueResponse) {
                    self.accountValue = Double(accountValue) / (pow(10.0, 18.0))
                } else {
                    print("Error with account value \(response)")
                }
            }
    }
    
    func getFreeCollateral() {
        Web3Manager.shared
            .getFreeCollateral(accountAddress: publicAddress, metadata: metadata)?
            .done { response in
                
                guard let valueResponse = response["_success"] as? Bool else {
                    print("Didnt get any response \(response)")
                    return
                }
                                
                guard let freeCollatValue = response["0"].underlying as? BigUInt else {
                    print("Unable to unwrap free collat value \(response)")
                    return
                }
                
                if (valueResponse) {
                    self.freeCollateral = Double(freeCollatValue) / (pow(10.0, 6.0))
                } else {
                    print("Error with account value \(response)")
                }
            }
    }
    
}

