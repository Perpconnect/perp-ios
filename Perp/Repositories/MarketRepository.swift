import Foundation
import Apollo

protocol MarketRepositoryProtocol {
    func fetchMarkets(completion: @escaping ([Market]) -> Void)
    func fetchPositions(traderAddress: String, completion: @escaping (GraphQLResult<GetPositionsQuery.Data>?) -> Void)

}

final class MarketRepository: MarketRepositoryProtocol {
    private let apiService: MarketApiServiceProtocol
    
    init(apiService: MarketApiServiceProtocol = MarketApiService()) {
        self.apiService = apiService
    }
    
    func fetchMarkets(completion: @escaping ([Market]) -> Void) {
        apiService.fetchMarkets(completion: completion)
    }
    
    func fetchPositions(traderAddress: String, completion: @escaping (GraphQLResult<GetPositionsQuery.Data>?) -> Void) {
        apiService.fetchPositions(traderAddress: traderAddress, completion: completion)
    }
    
}
