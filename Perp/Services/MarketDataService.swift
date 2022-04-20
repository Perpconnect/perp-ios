import Foundation
import Combine
import Apollo
import web3swift
import BigInt

class MarketDataService {
    
    @Published var market: Market
    
    @Published var stats: GetStatisticsQuery.Data.GetStatistic?
    
    @Published var chartPrices: [Double]?
    
    @Published var position: Position?
    
    @Published var marketStats: MarketStatistics?
    
    @Published var accountValue: Double?
    
    
    var marketSubscripiton: AnyCancellable?
    
    let metadata: PerpMetadataAPIModel
    
    let publicAddress: String?
    
    init(market: Market, perpMetaData: PerpMetadataAPIModel) {
        self.publicAddress = UserDefaults.standard.string(forKey: "publicAddress") ?? "0x0000000000000000000000000000000000000000"
        self.market = market
        self.metadata = perpMetaData
        getMarket(metadata: perpMetaData)
        getChartData(metadata: perpMetaData)
        getPosition(metadata: perpMetaData)
        getFunding(metadata: perpMetaData)
        getIndexPrice()
        getMarketPrice()
        getAccountValue(metadata: perpMetaData)
        getAllPositionValues()
    }
    
    func getIndexPrice() {
        _ = metadata.contracts
            .first(where: {(($0.key.contains("PriceFeed") == false) && $0.key.contains("\(market.name)")) })
            .map { market in
                Web3Manager.shared.getIndexPrice(indexAddress: market.value.address)?
                .done { response in
                    
                    guard let valueResponse = response["_success"] as? Bool else {
                        print("Didnt get any response \(response)")
                        return
                    }
                    
                    guard let indexPrice = response["0"].underlying as? BigUInt else {
                        print("Unable to index price \(response)")
                        return
                    }
                    
                    if (valueResponse) {
                        if (self.marketStats == nil) {
                            self.marketStats = MarketStatistics(
                                indexPrice: Double(indexPrice) / (pow(10.0, 18))
                            )
                        } else {
                            self.marketStats = self.marketStats?.updateIndexPrice(indexPrice: Double(indexPrice) / (pow(10.0, 18.0)))
                        }
        
                    } else {
                        print("Error with index response value \(response)")
                    }
                }
            }
    }
    
    func getMarketPrice() {
        _ = metadata.contracts
            .first(where: {(($0.key.contains("PriceFeed") == true) && $0.key.contains("\(market.name)")) })
            .map { market in
                Web3Manager.shared.getMarketPrice(
                    priceFeedAddress: market.value.address,
                    type: market.key.contains("Band") ? .band : .chainlink
                )?
                .done { response in
                    
                    guard let valueResponse = response["_success"] as? Bool else {
                        print("Didnt get any response in market price \(response)")
                        return
                    }
                    
                    guard let marketPrice = response["0"].underlying as? BigUInt else {
                        print("Unable to market price \(response)")
                        return
                    }
                    
                    if (valueResponse) {
                        if (self.marketStats == nil) {
                            self.marketStats = MarketStatistics(
                                markPrice: Double(marketPrice) / (pow(10.0, Double(Globals.Variables.priceFeedDecimals[self.market.name] ?? 18)))
                            )
                        } else {
                            self.marketStats = self.marketStats?.updateMarkPrice(markPrice: Double(marketPrice) / (pow(10.0, Double(Globals.Variables.priceFeedDecimals[self.market.name] ?? 18))))
                        }
                        
                    } else {
                        print("Error with market response value \(response)")
                    }
                }
            }
        
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
    
    func getPosition(metadata: PerpMetadataAPIModel) {
        guard let address = self.publicAddress else {
            print("Unable to get address.")
            return
        }
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
                                    avgOpenPrice: Double(position?.entryPrice ?? "0.0"),
                                    allPosValues: nil
                                )
                                
                            }
                        case .failure(let error):
                            print("Failure in getPosition! Error: \(error)")
                        }
                    }
                }
        }
    
    func getAllPositionValues() {
        guard let address = self.publicAddress else {
            print("Unable to get address.")
            return
        }
        
        Network
            .shared
            .apolloCurie
            .fetch(query: GetTraderQuery(address: address)) { result in
                switch result {
                case .success(let graphQLResult):
                    DispatchQueue.main.async {
                        let positions = graphQLResult.data?.trader?.positions
                        
                        var posValue = 0.0
                        
                        positions?.compactMap { position in
                            posValue += Double(position.openNotional) ?? 0.0
                        }
                        .map { _ in
                            self.position = self.position?.updateAllPositionValue(allPosValues: posValue)
                        }
                    }
                case .failure(let error):
                    print("Failure in getTrader! Error: \(error)")
                }
            }
    }
    
    func getAccountValue(metadata: PerpMetadataAPIModel) {
        guard let address = self.publicAddress else {
            print("Unable to find address.")
            return
        }
        Web3Manager.shared
            .getAccountValue(accountAddress: address, metadata: metadata)?
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
    
}

