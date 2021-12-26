//
//  MarketView.swift
//  Perp
//
//  Created by Shreyas Papinwar on 14/08/21.
//

import SwiftUI

struct MarketView: View {
    
    @ObservedObject var perpVM: PerpetualViewModel
    
    func dataInit() {
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
                        Text("Price")
                        
                    }
                    .foregroundColor(Color(#colorLiteral(red: 0.482352972, green: 0.482286036, blue: 0.4909058213, alpha: 1)))
                    .font(.system(size: 12))
                    .padding(.horizontal)
                    .padding(.top, 5)

                    ScrollView {
                        ForEach(perpVM.markets) { market in
                            NavigationLink(destination: SetorderView(market: market, perpVM: perpVM)) {
                                MarketListItem(market: market)
                                    .padding(.bottom, 5)
                            }
                        }
                        .padding(.bottom)
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
        .onAppear(perform: {
            dataInit()
            perpVM.syncData()
        })
    }
}
