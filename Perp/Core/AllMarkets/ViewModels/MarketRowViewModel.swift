import Foundation
import Combine

class MarketRowViewModel: ObservableObject {
    @Published var market: Market
    
    private let marketService: MarketDataService
    
    private var cancellables = Set<AnyCancellable>()
    
    
    init(market: Market, metadata: PerpMetadataAPIModel) {
        self.market = market
        self.marketService = MarketDataService(market: market, perpMetaData: metadata)
        addSubscribers()
    }
    
    func addSubscribers() {
        marketService.$market
            .sink { [weak self] returnedMarket in
                self?.market = returnedMarket
            }
            .store(in: &cancellables)
    
    }
    
}

