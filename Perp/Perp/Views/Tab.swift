//
//  TabView.swift
//  Perp
//
//  Created by Shreyas Papinwar on 11/08/21.
//

import SwiftUI

struct Tab: View {
    init() {
        UITabBar.appearance().backgroundColor = UIColor(Color(#colorLiteral(red: 0.06283180416, green: 0.0625443086, blue: 0.07983870059, alpha: 1)))
        UITabBar.appearance().barTintColor = UIColor(Color(#colorLiteral(red: 0.06283180416, green: 0.0625443086, blue: 0.07983870059, alpha: 1)))
        UITabBar.appearance().isTranslucent = true
    }
    
    var body: some View {
        TabView {
            MarketView()
                .tabItem {
                    Label("Markets", systemImage: "bitcoinsign.circle.fill")
                }
            
            Text("Staking")
                .tabItem {
                    Label("Staking", systemImage: "infinity.circle.fill")
                }
            
            Text("Rewards")
                .tabItem {
                    Label("Rewards", systemImage: "gift.fill")
                }
            
            Text("Assets")
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
