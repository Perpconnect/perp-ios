import Foundation

final class AssetsViewModel: ObservableObject, Identifiable {
    @Published var network: Networks = .optimism
    private let repository: AssetRepositoryProtocol
    @Published var account: Account = Account()
    
    private let publicAddress: String
    private let privateKey: String?
    
    init(repository: AssetRepositoryProtocol = AssetRepository(), publicAddress: String, privateKey: String?) {
        self.repository = repository
        self.publicAddress = publicAddress
        self.privateKey = privateKey
    }
    
    func onAppear() {
        repository.fetchAccount { account in
            self.account = account ?? Account()
        }
    }
    
}
