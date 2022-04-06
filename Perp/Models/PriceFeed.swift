import Foundation

struct PriceFeed: Codable {
    enum Feed: String, Codable {
        case chainlink = "ChainlinkPriceFeed"
        case band = "BandPriceFeed"
    }
    
    let address: Address
    let feed: Feed
}
