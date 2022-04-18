import Foundation

struct MarketStatistics: Codable {
    let open: Double?
    let markPrice: Double?
    let indexPrice: Double?
    let fundingRate: Double?
    
    init(
        open: Double? = 0.0,
        markPrice: Double? = 0.0,
        indexPrice: Double? = 0.0,
        fundingRate: Double? = 0.0
    ) {
        self.open = open
        self.markPrice = markPrice
        self.indexPrice = indexPrice
        self.fundingRate = fundingRate
    }
    
    func updateFundingRate(fundingRate: Double) -> MarketStatistics {
        return MarketStatistics(
            open: self.open,
            markPrice: self.markPrice,
            indexPrice: self.indexPrice,
            fundingRate: fundingRate
        )
    }
    
}
