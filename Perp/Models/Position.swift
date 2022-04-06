import Foundation

import Foundation

// MARK: - Position
struct Position: Codable {
    var baseToken, positionSize, openNotional, entryPrice: String?
    
    init(
        baseToken: String? = nil,
        positionSize: String? = nil,
        openNotional: String? = nil,
        entryPrice: String? = nil
    )  {
        self.baseToken = baseToken
        self.positionSize = positionSize
        self.openNotional = openNotional
        self.entryPrice = entryPrice
    }
}
