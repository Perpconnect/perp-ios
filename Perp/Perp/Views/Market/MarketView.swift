//
//  MarketView.swift
//  Perp
//
//  Created by Shreyas Papinwar on 14/08/21.
//

import SwiftUI

struct MarketView: View {
    init() {
        UINavigationBar.appearance().barTintColor = UIColor(Color(#colorLiteral(red: 0.06283180416, green: 0.0625443086, blue: 0.07983870059, alpha: 1)))
        UINavigationBar.appearance().isTranslucent = false
        
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        
    }
    var body: some View {
        NavigationView {
            ZStack {
                Color(#colorLiteral(red: 0.06283180416, green: 0.0625443086, blue: 0.07983870059, alpha: 1))
                    .ignoresSafeArea()
                VStack {
                    HStack {
                        Text("Trading Pairs")
                        Spacer()
                        Text("Price / Vol")
                        Spacer()
                        Text("24H Change")
                    }
                    .foregroundColor(Color(#colorLiteral(red: 0.482352972, green: 0.482286036, blue: 0.4909058213, alpha: 1)))
                    .font(.system(size: 12))
                    .padding()

                    ScrollView {
                        MarketListItem()
                        MarketListItem()
                        MarketListItem()
                        MarketListItem()
                        MarketListItem()
                        MarketListItem()
                    }
                }
            }
            .navigationBarTitle("Markets")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink(destination: MarketView()) {
                        Image(systemName: "person")
                            .foregroundColor(.white)
                            .background(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: MarketView()) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.white)
                            .background(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                    }
                }
            }
        }
        .accentColor(.white)
    }
}

struct MarketView_Previews: PreviewProvider {
    static var previews: some View {
        MarketView()
    }
}
