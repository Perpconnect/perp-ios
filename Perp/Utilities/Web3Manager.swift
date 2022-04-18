import Foundation
import Combine
import web3swift
import BigInt
import PromiseKit
import AVFoundation

class Web3Manager {
    
    enum web3Error: LocalizedError {
        case badURLResponse(url: URL)
        case RPCError
        case URLError
        case contractError(address: String)
        case readError
        case contractPromiseError
        case unknown
        case unknownError(error: String)
        
        var errorDescription: String?{
            switch self {
            case .badURLResponse(url: let url): return "Bad response from URL: \(url)"
            case .RPCError: return "Unable to init RPC \(Endpoint.API.rpcUrl)"
            case .URLError: return "Incorrect RPC url"
            case .contractError(address: let address): return "Unable to get contract \(address)"
            case .readError: return "Unable to read contract"
            case .contractPromiseError: return "Unable to get transaction."
            case .unknown: return "Unknown error occured"
            case.unknownError(error: let error): return "\(error)"
            }
        }
    }
    
    static func callSmartContract(
        web3instance: web3,
        contractAbi: String,
        contractAddress: EthereumAddress,
        function: String,
        params: [AnyObject],
        extradata: Data = Data()
    ) -> Promise<[String : Any]> {
        
        
        let result: Promise<[String: Any]> = Promise { seal in
            DispatchQueue.global(qos: .background).async {
                guard let contract = web3instance.contract(
                    contractAbi,
                    at: contractAddress,
                    abiVersion: 2
                ) else {
                    fatalError("Unable to get contract")
                }
                
                DispatchQueue.main.async {
                    contract
                        .read(
                            function,
                            parameters: params,
                            extraData: extradata
                        )?
                        .callPromise()
                        .done(on: .main) { d in
                            seal.fulfill(d)
                        } .catch(on: .main) { e in
                            seal.reject(e)
                        }
                }
                
            }
            
        }
        
        return result
        
    }
    
}
