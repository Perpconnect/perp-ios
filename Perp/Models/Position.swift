import Foundation

struct Position: Codable {
    
    enum Side: Codable {
        case long
        case short
    }
    
    let size: Double?
    var pnl: Double?
    let openNotional: Double?
    let liqPrice: Double?
    let accMarginRatio: Double?
    let accLeverage: Double?
    let side: Side?
    let avgOpenPrice: Double?
    
    // Not needed for display
    let allPosValues: Double?
    
    func updateAllPositionValue(allPosValues: Double) -> Position {
        return Position(
            size: self.size,
            pnl: self.pnl,
            openNotional: self.openNotional,
            liqPrice: self.liqPrice,
            accMarginRatio: self.accMarginRatio,
            accLeverage: self.accLeverage,
            side: self.side,
            avgOpenPrice: self.avgOpenPrice,
            allPosValues: allPosValues
        )
    }
    
}
