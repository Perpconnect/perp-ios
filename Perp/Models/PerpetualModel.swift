//
//  PerpetualModel.swift
//  Perp
//
//  Created by Shreyas Papinwar on 29/10/21.
//

import Foundation

struct PerpetualModel {
    private(set) var markets = [Market]()
    private(set) var positions = [Position]()
    
    init() {
        for amm in amms {
            markets.append(Market(amm: amm, currentPrice: "0.0", markPrice: "0.0", dayChange: "0"))
        }
    }
    
    mutating func update(market: Market) {
        for index in 0..<markets.count {
            if markets[index].amm.address == market.amm.address {
                markets[index].currentPrice = market.currentPrice
                markets[index].markPrice = market.markPrice
                markets[index].dayChange = market.dayChange
            }
        }
        
    }
    
    mutating func sync(position: Position) {
        if positions.isEmpty {
            positions.append(position)
        } else {
            for index in 0..<positions.count {
                if positions[index].symbol == position.symbol {
                    positions[index].leverage = position.leverage
                    positions[index].amount = position.amount
                    positions[index].notional = position.notional
                    positions[index].entry = position.entry
                    positions[index].mark = position.mark
                    positions[index].liquadation = position.liquadation
                    positions[index].pnl = position.pnl
                }
            }
        }
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
        var mark: String
        var liquadation: String
        var leverage: String
        var pnl: String
    }
    
}
