import Foundation
import Combine

class MarketViewModel: ObservableObject {
    var market: Market
    var metadata: PerpMetadataAPIModel
    
    private let marketService: MarketDataService
    private var cancellables = Set<AnyCancellable>()
    
    @Published var stats: GetStatisticsQuery.Data.GetStatistic?
    @Published var marketStats: MarketStatistics?
    @Published var position: Position?
    @Published var chartPrices: [Double]? = []
    
    
    init(market: Market, metadata: PerpMetadataAPIModel) {
        self.market = market
        self.metadata = metadata
        self.marketService = MarketDataService(market: market, perpMetaData: metadata)
        addSubscribers()
    }
    
    func addSubscribers() {
        marketService.$market
            .sink { [weak self] returnedMarket in
                self?.market = returnedMarket
            }
            .store(in: &cancellables)
        
        marketService.$stats
            .sink { [weak self] returnedStats in
                self?.stats = returnedStats
            }
            .store(in: &cancellables)
        
        marketService.$chartPrices
            .sink { [weak self] returnedPrices in
                self?.chartPrices = returnedPrices
            }
            .store(in: &cancellables)
        
        marketService.$position
            .sink { [weak self] returnedPosition in
                self?.position = returnedPosition
            }
            .store(in: &cancellables)
        
        marketService.$marketStats
            .sink { [weak self] returnedStats in
                self?.marketStats = returnedStats
            }
            .store(in: &cancellables)
        
    }
    
}
