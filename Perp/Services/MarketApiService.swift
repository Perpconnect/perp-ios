import Foundation
import Alamofire
import Apollo

protocol MarketApiServiceProtocol {
    func fetchMarkets(completion: @escaping ([Market]) -> Void)
    func fetchPositions(traderAddress: String, completion: @escaping (GraphQLResult<GetPositionsQuery.Data>?) -> Void)
    
}

final class MarketApiService: MarketApiServiceProtocol {
    
    func fetchPositions(traderAddress: String, completion: @escaping (GraphQLResult<GetPositionsQuery.Data>?) -> Void) {
        DispatchQueue.global(qos: .background).async {
            Network.shared.apollo.fetch(query: GetPositionsQuery(traderAddress: "0x70332de459d5554a9a310a7c4f7c6069c73604f9")) { result in
                switch result {
                
                case .success(let graphQLResult):
                    completion(graphQLResult)
            
                case .failure(let error):
                    print("Failure! Error: \(error)")
                    completion(nil)
                }
            }
        }
    }
    
    func fetchMarkets(completion: @escaping ([Market]) -> Void) {
        let request = AF.request(Endpoint.API.perpMetadata)
        var markets: [Market] = []
        
        DispatchQueue.global(qos: .background).async {
            request.responseDecodable(of: PerpMetadataAPIModel.self) { (response) in
                guard let metadata = response.value else { return }

                markets = metadata.contracts
                    .compactMap { contract in
                        var feed: PriceFeed.Feed = .chainlink
                        var market: Market?
                        
                        if(contract.key.contains("ChainlinkPriceFeed") || contract.key.contains("BandPriceFeed")) {
                            
                            if contract.key.contains("ChainlinkPriceFeed") {
                                feed = .chainlink
                            } else {
                                feed = .band
                            }
                                                    
                            let pair = contract.key.components(separatedBy: feed.rawValue)[0]
                            let tokenName = pair.components(separatedBy: "USD")[0]
                            let baseToken = metadata.contracts["v\(tokenName)"]
                            let feedValue = PriceFeed(
                                address: Address(
                                    address: contract.value.address,
                                    createdBlockNumber: contract.value.createdBlockNumber,
                                    name: contract.value.name
                                ),
                                feed: feed
                            )
                            
                            market = Market(
                                baseToken: Address(
                                    address: baseToken?.address ?? "",
                                    createdBlockNumber: baseToken?.createdBlockNumber,
                                    name: baseToken?.name
                                ),
                                priceFeed: feedValue,
                                symbol: tokenName,
                                name: tokenName,
                                pair: pair
                            )
                        }
                        
                        return market
                    }
                completion(markets)
            }
        }
        
    }

}
