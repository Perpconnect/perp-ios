//
//  Globals.swift
//  Perp
//
//  Created by Shreyas Papinwar on 03/09/21.
//

import Foundation
import SwiftUI

let backgroundColor = Color(#colorLiteral(red: 0.04733969271, green: 0.05137168616, blue: 0.06161639839, alpha: 1))
let secondaryColor = Color(#colorLiteral(red: 0.1393499672, green: 0.1493407488, blue: 0.1577528417, alpha: 1))

let covalentAPI = "https://api.covalenthq.com"
let covalentAPIKey = "ckey_84935203df434b2c99ed14e4d7b"
let perpMetadataUrl = "https://s3.us-west-1.amazonaws.com/metadata.perp.fi/lushan/config_v2.production.json"

struct GlobalConfig {
    let theGraphApiUrl: String
    let rpcUrl: String
}

let testMarketData = [
    Market(
        baseToken: Address(address: "hjfdbs"),
        priceFeed: PriceFeed(address: Address(address: "hjfdbs"), feed: .chainlink),
        symbol: "BTC",
        name: "BTC",
        pair: "BTCUSD"
    )
]
