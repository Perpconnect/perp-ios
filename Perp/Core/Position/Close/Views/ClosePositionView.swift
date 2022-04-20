//
//  PositionClose.swift
//  Perp
//
//  Created by Shreyas on 20/04/2022.
//

import SwiftUI

struct ClosePositionView: View {
    
    @ObservedObject var vm: ClosePositionViewModel
    
    var body: some View {
        ZStack {
            NavigationView {
                ScrollView {
                    List {
                        pnlSection
                        
                        detailsSection
                    }
                    Spacer()
                }
                .navigationTitle("Close Position")
            }
        }
    }
    
    var pnlSection: some View {
        Section {
            sectionItem(key: "Profit / Loss", value: "\(vm.marketStats?.unRealisedPnl?.asNumberWithoutDecimals() ?? "-")")
        }
    }
    
    var detailsSection: some View {
        Section(header: Text("Txn Summary")) {
            sectionItem(key: "Pos. Size", value: "\(vm.position?.size?.asNumberWithoutDecimals() ?? "-")")
            sectionItem(key: "Exit Price", value: "\(vm.marketStats?.indexPrice?.asNumberWithoutDecimals() ?? "-")")
            sectionItem(key: "Trading Fee", value: "\(vm.marketStats?.indexPrice?.asNumberWithoutDecimals() ?? "-")")
            sectionItem(key: "Slippage", value: "1%")
        }
    }
    
    struct sectionItem: View {
        var key: String
        var value: String
        
        var body: some View {
            HStack {
                Text(key)
                Spacer()
                Text(value)
            }
        }
        
    }
    
}
