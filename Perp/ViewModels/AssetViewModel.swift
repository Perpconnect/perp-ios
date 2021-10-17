//
//  AccountViewModel.swift
//  Perp
//
//  Created by Shreyas Papinwar on 18/09/21.
//

import Foundation
import Combine
import Alamofire

class AssetViewModel: ObservableObject {
    @Published var tokens = [TokenBalance]()
    @Published var xDaiTokens = [xDaiTokenBalance]()
    
    @Published var totalBalanceEth = 0.0
    @Published var totalBalanceDai = 0.0
    
    func getxDaiTokenBalance(address: String) {
        let url = "\(apiURL)/tokens/64/\(address)"
        
        let req = AF.request(url, method: .get)
        
        req.responseJSON { res in
            var balances: [xDaiTokenBalance] = []
            var totalBalance = 0.0
            
            if let json = res.value as? [[String: Any]] {
                for item in json {
                    var token = xDaiTokenBalance()
                    token.balance = item["usd"] as? String
                    token.name = item["name"] as? String
                    token.contractAddress = item["contractAddress"] as? String
                    token.logo = item["logo_url"] as? String
                    token.symbol = item["symbol"] as? String
                    
                    totalBalance += Double(token.balance ?? "0.0")!
                    
                    balances.append(token)
                    print(token)
                }
            } else { // if json["data"] == null
                print("Error retriving balances - \(String(describing: res.value))")
            }
            
            self.xDaiTokens = balances
            self.totalBalanceDai = totalBalance
        }
        
    }
    
    func getAddressBalance(chainID: String, address: String, currency: String) {
        let url: String = covalentAPI + "/v1/" + chainID + "/address/" + address.lowercased() + "/balances_v2/"
    
        let params: [String: Any] = ["key": covalentAPIKey, "quote-currency": currency.lowercased(), "nft": "true", "no-nft-fetch": false]
        
        let req = AF.request(url, method: .get, parameters: params)

        req.responseJSON { res in
            var balances: [TokenBalance] = []
            var totalBalance = 0.0

            if let json = res.value as? [String:Any] {
                if let data = json["data"] as? [String:Any] {
                    if let items = data["items"] as? [[String:Any]] {
                        for item in items {
                            var token = TokenBalance()
                            token.contract_decimals = item["contract_decimals"] as? Int ?? 0
                            token.contract_name = item["contract_name"] as? String ?? ""
                            token.contract_ticker_symbol = item["contract_ticker_symbol"] as? String ?? ""
                            token.contract_address = item["contract_address"] as? String ?? ""
                            token.supports_erc = item["supports_erc"] as? Array ?? []
                            token.logo_url = item["logo_url"] as? String ?? ""
                            token.quote_rate = item["quote_rate"] as? Double ?? 0.0
                            token.amount = item["quote"] as? Double ?? 0.0
                            token.balance = Double(item["balance"] as? String ?? "0")
                            token.balance! /= pow(10, Double(item["contract_decimals"] as? Int ?? 0))

                            totalBalance += token.amount!

                            balances.append(token)
                        }
                    }
                } else { // if json["data"] == null
                    print("Error retriving balances - \(json)")
                }
            }
            self.totalBalanceEth = totalBalance
            self.tokens = balances
        }
    }
}
