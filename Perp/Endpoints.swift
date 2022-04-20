import Foundation

struct Endpoint {
    enum API {}
    enum KEYS {}
}

// MARK: API
extension Endpoint.API {
    
    // MARK: PROD
    static let perpMetadata = "https://metadata.perp.exchange/v2/optimism.json"
    static let rpcUrl = "https://mainnet.optimism.io"
    static let curieGraphUrl = "https://api.thegraph.com/subgraphs/name/perpetual-protocol/perpetual-v2-optimism"
    static let chainId = 10
    static let perpStatsApi = "https://4b3vdz2hdjho7gzuo4wl2jgsoe.appsync-api.ap-southeast-1.amazonaws.com/graphql"
    
    // MARK: DEV
//    static let perpMetadata = "https://metadata.perp.exchange/v2/optimism-kovan.json"
//    static let rpcUrl = "https://kovan.optimism.io"
//    static let curieGraphUrl = "https://api.thegraph.com/subgraphs/name/perpetual-protocol/perpetual-v2-optimism-kovan"
//    static let chainId = 69
//    static let perpStatsApi = "https://jvyyinoorbea5mnfucijfbw3xy.appsync-api.ap-northeast-1.amazonaws.com/graphql"
}

// MARK: KEYS
extension Endpoint.KEYS {
    // MARK: PROD
    static let perpStatsKey = "da2-6pzuogcgvvamdnv6sglgjnvk2a"
    
    // MARK: DEV
//    static let perpStatsKey = "da2-5lr5lvsbnrbrpfpgic743ocofi"
}
