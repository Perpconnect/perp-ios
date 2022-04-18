import Foundation

struct Position: Codable {
    
    enum Side: Codable {
        case long
        case short
    }
    
    let size: Double?
    let pnl: Double?
    let openNotional: Double?
    let liqPrice: Double?
    let accMarginRatio: Double?
    let accLeverage: Double?
    let side: Side?
    let avgOpenPrice: Double?
}
