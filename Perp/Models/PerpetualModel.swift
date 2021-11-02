//
//  PerpetualModel.swift
//  Perp
//
//  Created by Shreyas Papinwar on 29/10/21.
//

import Foundation

struct PerpetualModel {
    private(set) var markets: [Market]
    private(set) var positions: [Position]
    
    func update(market: Market) {
        
    }
    
    init() {
        markets = [Market]()
        
        for amm in amms {
            markets.append(Market(amm: amm, currentPrice: "0.00", markPrice: "0.00", dayChange: "9.2"))
        }
        
        positions = [Position]()
        
        positions.append(Position(symbol: "cs", amount: "sc", notional: "jhb", entry: "hbj", Mark: "kjbj", liquadation: "jkn", leverage: "jhb", pnl: "hjb"))
    }
    
    struct Market: Identifiable {
        var id = UUID()
        var amm: AmmInfo
        var currentPrice: String
        var markPrice: String
        var dayChange: String
    }
    
    struct Position: Identifiable {
        var id = UUID()
        var symbol: String
        var amount: String
        var notional: String
        var entry: String
        var Mark: String
        var liquadation: String
        var leverage: String
        var pnl: String
        
    }
    
}
