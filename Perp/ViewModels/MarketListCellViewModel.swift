import Foundation

final class MarketListCellViewModel: ObservableObject {
    @Published var market: Market
    @Published var price: Float?
    
    private let repository: Web3Repository
    
    init(market: Market, web3Repository: Web3Repository = Web3Repository()) {
        self.market = market
        self.repository = web3Repository
        self.fetchPrice()
    }
    
    func fetchPrice() {
        DispatchQueue.main.async {
            self.repository.fetchAssetPrice(priceFeed: self.market.priceFeed) { price in
                self.price = price
            }
        }
    }
}
