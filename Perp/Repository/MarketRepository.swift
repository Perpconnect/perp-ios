//
//  MarketRepository.swift
//  Perp
//
//  Created by Shreyas Papinwar on 05/09/21.
//

import SwiftUI

class MarketRepository {
    @Published var markets = [Market]()
    
    init() {
        loadData()
    }
    
    func updateMarket(_ market: Market) {
      if let index = self.markets.firstIndex(where: { $0.id == market.id }) {
        self.markets[index] = market
      }
    }
    
    private func loadData() {
        var tempArray = [Market]()
        for item in amms {
            tempArray.append(Market(amm: item, currentPrice: "0", markPrice: "0"))
        }
    }
    
}
