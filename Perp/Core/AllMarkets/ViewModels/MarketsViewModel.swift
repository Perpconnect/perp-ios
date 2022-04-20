import Foundation
import Combine

class MarketsViewModel: ObservableObject {
    @Published var allMarkets: [Market] = []
    @Published var filteredMarkets: [Market] = []
    @Published var perpMetadata: PerpMetadataAPIModel?
    @Published var search = ""
    @Published var showingAccountView: Bool = false

    private let metadataService = PerpMetadataService()
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        metadataService.$metadata
            .sink { [weak self] returnedMetadata in
                self?.perpMetadata = returnedMetadata
            }
            .store(in: &cancellables)
        
        metadataService.$allMarkets
            .sink { [weak self] returnedMarkets in
                self?.allMarkets = returnedMarkets
            }
            .store(in: &cancellables)
        
        $search
            .combineLatest(metadataService.$allMarkets)
            .debounce(for: .seconds(0.7), scheduler: DispatchQueue.main)
            .map(filterMarkets)
            .sink { [weak self] returnedMarkets in
                self?.filteredMarkets = returnedMarkets
            }
            .store(in: &cancellables)
    }
    
    private func filterMarkets(text: String, markets: [Market]) -> [Market] {
        guard !text.isEmpty else {
            return markets
        }
        
        let lowercasedText = text.lowercased()
        
        return markets.filter { (market) -> Bool in
            return market.name.lowercased().contains(lowercasedText)
        }
    }
    
}
