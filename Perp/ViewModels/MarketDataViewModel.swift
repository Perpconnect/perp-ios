//
//  MarketDataViewModel.swift
//  Perp
//
//  Created by Shreyas Papinwar on 11/09/21.
//

import Foundation
import Combine
import SwiftUI
import Resolver

class MarketDataViewModel: ObservableObject, Identifiable  {
    @Injected var marketRepository: MarketRepository
    @Published var market: Market
    
    init(market: Market) {
        self.market = market
    }
}
