import Foundation
import Apollo

class Network {
    static let shared = Network()
    lazy var apollo = ApolloClient(url: URL(string: Endpoint.API.curieGraphUrl)!)
}
