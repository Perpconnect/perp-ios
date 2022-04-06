import Foundation

protocol Web3RepositoryProtocol {
    func fetchAssetPrice(priceFeed: PriceFeed, completion: @escaping (Float?) -> Void)
    func fetchAccount(completion: @escaping (Account?) -> Void)
}

final class Web3Repository: Web3RepositoryProtocol {
    
    private let apiService: Web3ServiceProtocol
    
    init(apiService: Web3ServiceProtocol = Web3Service()) {
        self.apiService = apiService
    }
    
    func fetchAssetPrice(priceFeed: PriceFeed, completion: @escaping (Float?) -> Void) {
        apiService.fetchAssetPrice(priceFeed: priceFeed, completion: completion)
    }
    
    func fetchAccount(completion: @escaping (Account?) -> Void) {
        apiService.fetchAccount(completion: completion)
    }
}
