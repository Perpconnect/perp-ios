//
//  MarketViewModel.swift
//  Perp
//
//  Created by Shreyas Papinwar on 11/09/21.
//


import Foundation

class MarketViewModel: ObservableObject {
    @Published var marketRepository: MarketRepository = MarketRepository()
}
