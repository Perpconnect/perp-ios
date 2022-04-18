import Foundation
import Combine
import Apollo

class MarketDataService {
    
    @Published var market: Market
    
    @Published var stats: GetStatisticsQuery.Data.GetStatistic?
    
    @Published var chartPrices: [Double]?
    
    @Published var position: Position?
    
    @Published var marketStats: MarketStatistics?
    
    var marketSubscripiton: AnyCancellable?
    
    let metadata: PerpMetadataAPIModel
    
    init(market: Market, perpMetaData: PerpMetadataAPIModel) {
        let publicAddress = "0x6879f97a6a9e2c050e38fcb90ca97aaccd189eac"
        // UserDefaults.standard.string(forKey: "publicAddress") ?? "0x0000000000000000000000000000000000000000"
        self.market = market
        self.metadata = perpMetaData
        getMarket(metadata: perpMetaData)
        getChartData(metadata: perpMetaData)
        getPosition(address: publicAddress, metadata: perpMetaData)
        getFunding(metadata: perpMetaData)
    }
    
    func getFunding(metadata: PerpMetadataAPIModel) {
        _ = metadata.contracts
            .first(where: {(($0.key.contains("PriceFeed") == false) && $0.key.contains("\(market.name)")) })
            .map { contract in
                Network.shared.apolloCurie.fetch(query: GetFundingUpdateQuery(baseToken: contract.value.address)) { result in
                    switch result {
                  
                    case .success(let graphQLResult):
                        DispatchQueue.main.async {
                            if (self.marketStats == nil) {
                                self.marketStats = MarketStatistics(
                                    fundingRate: Double(graphQLResult.data?.fundingUpdateds.first?.dailyFundingRate ?? "0.0")
                                )
                            } else {
                                self.marketStats = self.marketStats?.updateFundingRate(fundingRate: Double(graphQLResult.data?.fundingUpdateds.first?.dailyFundingRate ?? "0.0") ?? 0.0)
                            }

                        }
                        
                    case .failure(let error):
                        print("Error fetching fundingRate: \(error)")
                        
                    }
                }
            }
    }
    
    func getChartData(metadata: PerpMetadataAPIModel) {
        _ = metadata.contracts
            .first(where: {(($0.key.contains("PriceFeed") == false) && $0.key.contains("\(market.name)")) })
            .map { contract in
                Network.shared.apollo.fetch(
                    query: ListCancleSticksQuery(
                        query: .init(
                            marketResolution: .init(eq: "\(contract.value.address)#4h"),
                            startTime: .init(
                                between: [
                                    Int(Date().severDayBefore.timeIntervalSince1970),
                                    Int(Date().timeIntervalSince1970)
                                ]
                            )
                        ),
                        limit: 100
                    )
                ) { result in
                    switch result {
                  
                    case .success(let graphQLResult):
                        var priceData: [Double] = []
                        DispatchQueue.main.async {
                            graphQLResult
                                .data?
                                .listCandleSticks?
                                .items
                                .map { candleObjects in
                                    _ = candleObjects.reversed().map { candle in
                                        let high = Double(candle?.high ?? "0.0") ?? 0.0
                                        let low = Double(candle?.low ?? "0.0") ?? 0.0
                                        let open = Double(candle?.open ?? "0.0") ?? 0.0
                                        let close = Double(candle?.close ?? "0.0") ?? 0.0
                                        
                                        if (open > close) {
                                            priceData.append(high)
                                            priceData.append(low)
                                        } else {
                                            priceData.append(low)
                                            priceData.append(high)
                                        }
                                        
                                    }
                                }
                                
                            self.chartPrices = priceData
                                
                        }
                        
                        
                    case .failure(let error):
                        print("Failure! Error: \(error)")
                    }
                }
            }
    }
    
    func getMarket(metadata: PerpMetadataAPIModel) {
        _ = metadata.contracts
            .first(where: {(($0.key.contains("PriceFeed") == false) && $0.key.contains("\(market.name)")) })
            .map { contract in
                Network.shared.apollo.fetch(query: GetStatisticsQuery(ammAddr: contract.value.address)) { result in
                
                  switch result {
                
                  case .success(let graphQLResult):
                      
                      DispatchQueue.main.async {
                          self.stats = graphQLResult.data?.getStatistics
                          
                          self.market = Market(
                            id: self.market.id,
                            name: self.market.name,
                            price: Double(graphQLResult.data?.getStatistics?.lastTradePriceUsd ?? "0.0"),
                            percentChange24H: Double(graphQLResult.data?.getStatistics?.priceChangeRate24h ?? "0.0")! * 100
                          )

                      }
                                      
                  case .failure(let error):
                
                    print("Failure! Error: \(error)")
                
                  }
            }
        }
    }
    
    func getPosition(address: String, metadata: PerpMetadataAPIModel) {
        _ = metadata.contracts
            .first(where: {(($0.key.contains("PriceFeed") == false) && $0.key.contains("\(market.name)")) })
            .map { contract in
                Network
                    .shared
                    .apolloCurie
                    .fetch(query: GetPositionQuery(address: address, baseToken: contract.value.address)) { result in
                        switch result {
                        case .success(let graphQLResult):
                            DispatchQueue.main.async {
                                let position = graphQLResult.data?.trader?.positions.first
                                let size = Double(position?.positionSize ?? "0.0") ?? 0.0
                                self.position = Position(
                                    size: size,
                                    pnl: nil,
                                    openNotional: Double(position?.openNotional ?? "0.0"),
                                    liqPrice: nil,
                                    accMarginRatio: nil,
                                    accLeverage: nil,
                                    side: (size < 0 ) ?
                                        .short : .long,
                                    avgOpenPrice: nil
                                )
                                
                            }
                        case .failure(let error):
                            print("Failure in getPosition! Error: \(error)")
                        }
                    }
                }
        }
    }

