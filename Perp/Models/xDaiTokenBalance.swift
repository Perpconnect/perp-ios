//
//  xDaiTokenBalance.swift
//  Perp
//
//  Created by Shreyas Papinwar on 18/09/21.
//

import Foundation
import Combine
import SwiftUI

struct xDaiTokenBalance: Hashable, Identifiable {
    var id = UUID()
    var balance: String?
    var contractAddress: String?
    var name: String?
    var symbol: String?
    var type: Type?
    var logo: String?
    var usd: String?
}

enum Type {
    case erc20
    case erc721
}
