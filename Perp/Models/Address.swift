import Foundation

struct Address: Codable {
    let address: String
    let createdBlockNumber: Int?
    let name: String?
    
    init(
        address: String,
        createdBlockNumber: Int? = nil,
        name: String? = nil
    ) {
        self.address = address
        self.createdBlockNumber = createdBlockNumber
        self.name = name
    }
}
