import Foundation

// MARK: - PerpMetadataAPIModel
struct PerpMetadataAPIModel: Codable {
    let chainID: Int
    let contracts: [String: Contract]
    let externalContracts: ExternalContracts
    let network: String
    let pools: [Pool]

    enum CodingKeys: String, CodingKey {
        case chainID = "chainId"
        case contracts, externalContracts, network, pools
    }
    
    // MARK: - Contract
    struct Contract: Codable {
        let address: String
        let createdBlockNumber: Int
        let name: String
    }

    // MARK: - ExternalContracts
    struct ExternalContracts: Codable {
        let defaultProxyAdmin, usdc, uniswapV3Factory: String

        enum CodingKeys: String, CodingKey {
            case defaultProxyAdmin = "DefaultProxyAdmin"
            case usdc = "USDC"
            case uniswapV3Factory = "UniswapV3Factory"
        }
    }

    // MARK: - Pool
    struct Pool: Codable {
        let address, baseAddress, baseSymbol: String
        let quoteAddress: String
        let quoteSymbol: QuoteSymbol
    }

    enum QuoteSymbol: String, Codable {
        case vUSD = "vUSD"
    }
}
