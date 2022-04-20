import Foundation

struct MarketStatistics: Codable {
    let open: Double?
    let markPrice: Double?
    let indexPrice: Double?
    let fundingRate: Double?
    let unRealisedPnl: Double?
    
    init(
        open: Double? = 0.0,
        markPrice: Double? = 0.0,
        indexPrice: Double? = 0.0,
        fundingRate: Double? = 0.0,
        unRealisedPnl: Double? = 0.0
    ) {
        self.open = open
        self.markPrice = markPrice
        self.indexPrice = indexPrice
        self.fundingRate = fundingRate
        self.unRealisedPnl = unRealisedPnl
    }
    
    func updateFundingRate(fundingRate: Double) -> MarketStatistics {
        return MarketStatistics(
            open: self.open,
            markPrice: self.markPrice,
            indexPrice: self.indexPrice,
            fundingRate: fundingRate,
            unRealisedPnl: self.unRealisedPnl
        )
    }
    
    func updatePnl(pnl: Double) -> MarketStatistics {
        return MarketStatistics(
            open: self.open,
            markPrice: self.markPrice,
            indexPrice: self.indexPrice,
            fundingRate: self.fundingRate,
            unRealisedPnl: pnl
        )
    }
    
    func updateIndexPrice(indexPrice: Double) -> MarketStatistics {
        return MarketStatistics(
            open: self.open,
            markPrice: self.markPrice,
            indexPrice: indexPrice,
            fundingRate: self.fundingRate,
            unRealisedPnl: self.unRealisedPnl
        )
    }
    
    func updateMarkPrice(markPrice: Double) -> MarketStatistics {
        return MarketStatistics(
            open: self.open,
            markPrice: markPrice,
            indexPrice: self.indexPrice,
            fundingRate: self.fundingRate,
            unRealisedPnl: self.unRealisedPnl
        )
    }
    
}
