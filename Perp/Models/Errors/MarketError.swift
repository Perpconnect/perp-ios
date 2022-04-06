import Foundation
import Alamofire

enum MarketError: Error {
    case fetchMarketDecode
    
    var reason: String {
        switch self {
        case .fetchMarketDecode:
            return "Unable to decode Perp metadata for Markets."
        }
    }
}
