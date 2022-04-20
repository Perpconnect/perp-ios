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
    
    @Published var accountValue: Double?
    
    @Published var chartPrices: [Double]? = []
    
    @Published var showPosition: Bool = false
    
    @Published var marginratio: Double = 0.0
    
    
    init(market: Market, metadata: PerpMetadataAPIModel) {
        self.market = market
        self.metadata = metadata
        self.marketService = MarketDataService(market: market, perpMetaData: metadata)
        addSubscribers()
    }
    
    func calculatePnl() {
        if (position?.size != 0.0) {

            guard let markPrice = marketStats?.markPrice else {
                return
            }
            
            guard let posSize = position?.size else {
                return
            }
            
            guard let openPrice = position?.avgOpenPrice else {
                return
            }
                                    
            let pnl = (markPrice - openPrice) * posSize
            
            if (self.marketStats != nil) {
                self.marketStats = self.marketStats?.updatePnl(pnl: pnl)
            } else {
                self.marketStats = MarketStatistics(unRealisedPnl: pnl)
            }
        }
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
                self?.calculatePnl()
            }
            .store(in: &cancellables)
        
        marketService.$marketStats
            .sink { [weak self] returnedStats in
                self?.marketStats = returnedStats
                self?.calculatePnl()
            }
            .store(in: &cancellables)
        
        marketService.$accountValue
            .sink { [weak self] returnedAccValue in
                self?.accountValue = returnedAccValue
            }
            .store(in: &cancellables)
        
    }
    
}
