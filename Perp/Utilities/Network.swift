import Foundation
import Apollo

class Network {
    static let shared = Network()
    
    private(set) lazy var apolloCurie = ApolloClient(url: URL(string: Endpoint.API.curieGraphUrl)!)

    
    private(set) lazy var apollo: ApolloClient = {

        let cache = InMemoryNormalizedCache()
        let store1 = ApolloStore(cache: cache)
        let authPayloads = ["X-Api-Key": Endpoint.KEYS.perpStatsKey]
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = authPayloads
        
        let client1 = URLSessionClient(sessionConfiguration: configuration, callbackQueue: nil)
        let provider = NetworkInterceptorProvider(client: client1, shouldInvalidateClientOnDeinit: true, store: store1)
        
        let url = URL(string: Endpoint.API.perpStatsApi)!
        
        let requestChainTransport = RequestChainNetworkTransport(interceptorProvider: provider,
                                                                 endpointURL: url)
        
        return ApolloClient(networkTransport: requestChainTransport,
                            store: store1)
    }()
}
class NetworkInterceptorProvider: DefaultInterceptorProvider {
    override func interceptors<Operation: GraphQLOperation>(for operation: Operation) -> [ApolloInterceptor] {
        var interceptors = super.interceptors(for: operation)
        interceptors.insert(CustomInterceptor(), at: 0)
        return interceptors
    }
}

class CustomInterceptor: ApolloInterceptor {
    
    func interceptAsync<Operation: GraphQLOperation>(
        chain: RequestChain,
        request: HTTPRequest<Operation>,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Swift.Result<GraphQLResult<Operation.Data>, Error>) -> Void) {
            request.addHeader(name: "X-Api-Key", value: Endpoint.KEYS.perpStatsKey)
            
        chain.proceedAsync(request: request,
                           response: response,
                           completion: completion)
    }
}
