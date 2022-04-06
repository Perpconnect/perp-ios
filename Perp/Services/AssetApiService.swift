import Foundation

protocol AssetApiServiceProtocol {
    func fetchAccount(completion: (Account) -> Void)
}

final class AssetApiService: AssetApiServiceProtocol {
    
    func fetchAccount(completion: (Account) -> Void) {
        let account = Account(accountValue: 125.66,
                              freeCollatral: 100)
        completion(account)
    }

}
