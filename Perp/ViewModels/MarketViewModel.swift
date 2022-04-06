import Foundation

final class MarketViewModel: ObservableObject {
    @Published var market: Market
    @Published var toggle: String = "Stats"
    
    @Published var position = Position()
    
    private let marketRepo: MarketRepositoryProtocol
    let publicAddress = UserDefaults.standard.string(forKey: "publicAddress")!
    
    init(market: Market, marketRepo: MarketRepositoryProtocol = MarketRepository()) {
        self.market = market
        self.marketRepo = marketRepo
        getPosition()
    }
    
    func onAppear() {
        getPosition()
    }
    
    func getPosition() {
        marketRepo.fetchPositions(traderAddress: publicAddress) { data in
            guard let positions = data?.data?.trader?.positions else {
                return
            }

            positions
                .first(where: { $0.baseToken.lowercased() == self.market.baseToken.address.lowercased() })
                .map { position in
                    self.position.entryPrice = position.entryPrice
                    self.position.openNotional = position.openNotional
                    self.position.positionSize = position.positionSize
                    
                }
        }
    }
    
}
