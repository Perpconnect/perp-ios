//
//  Apollo.swift
//  Perp
//
//  Created by Shreyas Papinwar on 05/09/21.
//

import Foundation
import Apollo

class Network {
    static let shared = Network()
    lazy var apollo = ApolloClient(url: URL(string: "https://api.thegraph.com/subgraphs/name/perpetual-protocol/perp-position-subgraph")!)
}
