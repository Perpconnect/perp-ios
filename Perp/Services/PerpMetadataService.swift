import Foundation
import Combine

class PerpMetadataService {
    @Published var metadata: PerpMetadataAPIModel?
    @Published var allMarkets: [Market] = []
    var metataSubscription: AnyCancellable?
    
    init() {
        getMetadata()
    }
    
    private func getMetadata() {
        guard let url = URL(string: Endpoint.API.perpMetadata) else { return }
        
        metataSubscription = NetworkingManager.download(url: url)
            .decode(type: PerpMetadataAPIModel.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion,  receiveValue: { [weak self] (returnedMetadata) in
                self?.metadata = returnedMetadata
                self?.getMarkets()
                self?.metataSubscription?.cancel()
            })
    }
    
    private func getMarkets() {
                
        _ = metadata?.contracts
            .map { contract in
                if ((contract.value.name.contains("contracts/BaseToken"))) {
                    Network.shared.apollo.fetch(query: GetStatisticsQuery(ammAddr: contract.value.address)) { result in
                    
                        switch result {
                    
                        case .success(let graphQLResult):

                            self.allMarkets.append(Market(
                                name: String(contract.key.dropFirst()),
                                price: Double(graphQLResult.data?.getStatistics?.lastTradePriceUsd ?? "0.0"),
                                percentChange24H: Double(graphQLResult.data?.getStatistics?.priceChangeRate24h ?? "0.0")! * 100
                                )
                            )
                        case .failure(let error):
                            print("Failure! Error: \(error)")
                    
                      }
                    }
                }
            }
        
    }
    
}
