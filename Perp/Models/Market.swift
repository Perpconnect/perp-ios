//
//  Market.swift
//  Perp
//
//  Created by Shreyas Papinwar on 11/09/21.
//

import SwiftUI

struct Market: Identifiable {
    var id = UUID()
    var amm: AmmInfo
    var currentPrice: String
    var markPrice: String
}

