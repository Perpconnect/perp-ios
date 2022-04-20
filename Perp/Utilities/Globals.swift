import Foundation

struct Globals {
    enum Variables {}
}

// MARK: Variables
extension Globals.Variables {
    static let marketFullNames = [
        "ATOM": "Cosmos",
        "AVAX": "Avalanche",
        "BNB": "Binance",
        "BTC": "Bitcoin",
        "CRV": "Curve",
        "ETH": "Ethereum",
        "FLOW": "Flow Protocol",
        "FTM": "Fantom",
        "LINK": "Chainlink",
        "LUNA": "Terra",
        "MATIC": "Polygon",
        "NEAR": "NEAR Protocol",
        "PERP": "Perpetual Protocol",
        "SAND": "Sandbox",
        "SOL": "Solana",
        "ONE": "Harmony",
        "AAVE": "Aave Protocol"
    ]
    
    static let priceFeedDecimals = [
        "ATOM": 8,
        "AVAX": 18,
        "BNB": 8,
        "BTC": 8,
        "CRV": 18,
        "ETH": 8,
        "FLOW": 8,
        "FTM": 8,
        "LINK": 8,
        "LUNA": 18,
        "MATIC": 8,
        "NEAR": 8,
        "PERP": 18,
        "SAND": 18,
        "SOL": 18,
        "ONE": 8,
        "AAVE": 8
    ]
}
