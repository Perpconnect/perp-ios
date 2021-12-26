//
//  TabView.swift
//  Perp
//
//  Created by Shreyas Papinwar on 11/08/21.
//

import SwiftUI

struct Tab: View {
    init() {
        UITabBar.appearance().backgroundColor = UIColor(backgroundColor)
        UITabBar.appearance().barTintColor = UIColor(backgroundColor)
        UITabBar.appearance().isTranslucent = true
        
    }
    
    @State var selection = 0
    
    let impact = UIImpactFeedbackGenerator(style: .medium)
    
    var body: some View {
        TabView {
            MarketView(perpVM: PerpetualViewModel())
                .tabItem {
                    Label("Markets", systemImage: "bitcoinsign.circle.fill")
                }
            
//            StakingView()
//                .tabItem {
//                    Label("Staking", systemImage: "infinity.circle.fill")
//                }
//
//            RewardsView()
//                .tabItem {
//                    Label("Rewards", systemImage: "gift.fill")
//                }
            
            AssetsView(tokenVM: AssetViewModel())
                .tabItem {
                    Label("Assets", systemImage: "creditcard.fill")
                }
        }
        .accentColor(Color(#colorLiteral(red: 0.9977523685, green: 0.6921175718, blue: 0.09948458523, alpha: 1)))
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        Tab()
    }
}
