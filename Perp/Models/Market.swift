import Foundation

struct Market: Identifiable, Codable {
    var id = UUID()
    var baseToken: Address
    var priceFeed: PriceFeed
    var symbol: String
    var name: String
    var pair: String
}
