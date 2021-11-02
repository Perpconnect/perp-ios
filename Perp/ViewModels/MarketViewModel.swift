//
//  MarketViewModel.swift
//  Perp
//
//  Created by Shreyas Papinwar on 11/09/21.
//

import Foundation
import Combine
import Alamofire

class MarketViewModel: ObservableObject {
    @Published var markets = [Market]()
        
    init() {
        loadData()
    }
    
    private func loadData() {
        var tempArray = [Market]()
        for item in amms {
            getPriceData(amm: item)
            tempArray.append(Market(amm: item, currentPrice: "0", markPrice: "0", dayChange: "-0.1"))
        }
        markets = tempArray
    }
    
    private func getPriceData(amm: AmmInfo) {
        let url = covalentAPI + "/v1/pricing/historical/usd/\(amm.symbol)/"
        
        let current_date = get_current_date()

        let params: [String: String] = ["key": covalentAPIKey, "from": get_yesterday(), "to": current_date]
        
        let req = AF.request(url, method: .get, parameters: params)
        
        req.responseJSON { res in
            print(res.value)
        }
    }
    
    private func get_current_date() -> String {
        let dateFormatter = DateFormatter()

        dateFormatter.dateFormat = "yyyy-MM-dd"

        return dateFormatter.string(from: Date())
    }
    
    private func get_yesterday() -> String {
        let dateFormatter = DateFormatter()

        dateFormatter.dateFormat = "yyyy-MM-dd"

        return dateFormatter.string(from: Date().addingTimeInterval(-86400))
    }
    
}
