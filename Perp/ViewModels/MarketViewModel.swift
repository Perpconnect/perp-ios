//
//  MarketViewModel.swift
//  Perp
//
//  Created by Shreyas Papinwar on 11/09/21.
//

import Foundation
import Combine
import Resolver

class MarketViewModel: ObservableObject {
    @Published var markets = [Market]()
        
    init() {
        loadData()
    }
    
    private func loadData() {
        var tempArray = [Market]()
        for item in amms {
            tempArray.append(Market(amm: item, currentPrice: "0", markPrice: "0"))
        }
        markets = tempArray
    }
    
}
