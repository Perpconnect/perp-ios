//
//  PerpetualViewModel.swift
//  Perp
//
//  Created by Shreyas Papinwar on 29/10/21.
//

import SwiftUI
import Alamofire

class PerpetualViewModel: ObservableObject {
    @Published var model: PerpetualModel = PerpetualModel()
    
    var markets: [PerpetualModel.Market] {
        return model.markets
    }
    
    var positions: [PerpetualModel.Position] {
        return model.positions
    }
    
    var positionCount: Int {
        return model.positions.count
    }
    
    var marketCount: Int {
        return model.markets.count
    }
    
    func modelChange() {
        objectWillChange.send()
    }
    
    func syncData() {
        let url: String = covalentAPI + "/v1/pricing/tickers/"

        let params: [String: Any] = ["key": covalentAPIKey, "tickers": all_amms]

        let req = AF.request(url, method: .get, parameters: params)

        req.responseJSON { res in
            if let json = res.value as? [String:Any] {
                if let data = json["data"] as? [String:Any] {
                    if let items = data["items"] as? [[String:Any]] {
                        for item in items {
                            for amm in amms where amm.symbol == item["contract_ticker_symbol"] as? String ?? "" {
                                self.model.update(market:
                                    PerpetualModel.Market(amm: amm,
                                           currentPrice: String(item["quote_rate"] as? Double ?? 0.0),
                                           markPrice: String(item["quote_rate"] as? Double ?? 0.0),
                                           dayChange: "9.2"
                                    )
                                )
                            }
                        }
                    }
                }
            }
        }
                
        Network.shared.apollo.fetch(query: GetPositionQuery(address: "0xb99e4a2a0a72cf2f15c29ca4b5a42d9c41cb0f33")) { graphQlResult in
            switch(graphQlResult) {
                
            case .success(let result):
                if let allPositions = result.data?.position?.ammPositions {
                    for position in allPositions {
                        
                        self.model.sync(position:
                            PerpetualModel.Position(
                                symbol: "LINK",
                                amount: position.margin,
                                notional: position.openNotional,
                                entry: position.entryPrice,
                                mark: "poooo",
                                liquadation: position.liquidationPenalty,
                                leverage: position.leverage,
                                pnl: position.totalPnlAmount
                            )
                        )
                    }
                }
                
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
}
