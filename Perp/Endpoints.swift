import Foundation

struct Endpoint {
    enum API {}
}

// MARK: API
extension Endpoint.API {
    
    // MARK: PROD
    static let perpMetadata = "https://metadata.perp.exchange/v2/optimism.json"
    static let rpcUrl = "https://opt-mainnet.g.alchemy.com/v2/_1TvuyIZgcbHqxqkaDc5gWF9-y8llX4u"
    static let curieGraphUrl = "https://api.thegraph.com/subgraphs/name/perpetual-protocol/perpetual-v2-optimism"
    static let chainId = 10
    
        // MARK: DEV
//    static let perpMetadata = "https://metadata.perp.exchange/v2/optimism-kovan.json"
//    static let rpcUrl = "https://opt-kovan.g.alchemy.com/v2/TQiM3jlGz5VEmR4Nz6NYK7EZG8ncinv3"
//    static let curieGraphUrl = "https://api.thegraph.com/subgraphs/name/perpetual-protocol/perpetual-v2-optimism-kovan"
//    static let chainId = 69
}
