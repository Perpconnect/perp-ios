import Foundation

final class MarketListViewModel: ObservableObject, Identifiable {
    @Published var markets: [Market] = []
    @Published var isShowingLoader = false
    
    private let repository: MarketRepositoryProtocol
    
    init(repository: MarketRepositoryProtocol = MarketRepository()) {
        self.repository = repository
        self.onAppear()
    }
    
    func onAppear() {
        self.isShowingLoader = true
        repository.fetchMarkets { markets in
            self.markets = markets.map { $0 }
            self.isShowingLoader = false
        }
    }
    
}
