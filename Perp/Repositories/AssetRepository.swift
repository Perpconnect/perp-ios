import Foundation

protocol AssetRepositoryProtocol {
        func fetchAccount(completion: @escaping (Account?) -> Void)
}

final class AssetRepository: AssetRepositoryProtocol {
    private let web3Serive: Web3ServiceProtocol
    
    init(apiService: AssetApiServiceProtocol = AssetApiService(), web3Service: Web3ServiceProtocol = Web3Service()) {
        self.web3Serive = web3Service
    }
    
    func fetchAccount(completion: @escaping (Account?) -> Void) {
        web3Serive.fetchAccount(completion: completion)
    }

}
