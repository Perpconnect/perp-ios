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
    @Published var marketRepository: MarketRepository = Resolver.resolve()
    @Published var marketDataViewModels = [MarketDataViewModel]()
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        marketRepository.$markets.map { markets in
            markets.map { market in
                MarketDataViewModel(market: market)
            }
        }
        .assign(to: \.marketDataViewModels, on: self)
        .store(in: &cancellables)
    }
    
}