//
//  MarketView.swift
//  Perp
//
//  Created by Shreyas Papinwar on 14/08/21.
//

import SwiftUI

struct MarketView: View {
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.shadowColor = .clear
        appearance.backgroundColor = UIColor(backgroundColor)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        
        UINavigationBar.appearance().isTranslucent = false
    }
    var body: some View {
        NavigationView {
            ZStack {
                backgroundColor
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
                    .padding(.horizontal)
                    .padding(.top, 5)

                    ScrollView {
                        NavigationLink(destination: SetorderView()) {
                            MarketListItem()
                        }
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
                    NavigationLink(destination: AccountView()) {
                        Image(systemName: "person")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 30, height: 30)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: AccountView()) {
                        Image(systemName: "envelope")
                            .foregroundColor(.white)
                            .frame(width: 30, height: 30)
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
