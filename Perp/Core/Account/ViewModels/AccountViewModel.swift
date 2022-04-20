import Foundation
import Combine

class AccountViewModel: ObservableObject {
    @Published var showPrivateKeyView: Bool = false
    @Published var accountValue: Double = 0.0
    @Published var freeCollateral: Double = 0.0
    
    @Published var accountService: AccountDataService

    private var cancellables = Set<AnyCancellable>()

    init(metadata: PerpMetadataAPIModel) {
        
        self.accountService = AccountDataService(metadata: metadata)
        addSubscribers()
    }

    func addSubscribers() {
        accountService.$accountValue
            .sink { [weak self] returnedAccountValue in
                self?.accountValue = returnedAccountValue
            }
            .store(in: &cancellables)
        
        accountService.$freeCollateral
            .sink { [weak self] returnedFreeCollateral in
                self?.freeCollateral = returnedFreeCollateral
            }
            .store(in: &cancellables)
    }
}
