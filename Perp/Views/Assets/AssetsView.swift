//
//  AssetsView.swift
//  Perp
//
//  Created by Shreyas Papinwar on 01/09/21.
//

import SwiftUI

struct AssetsView: View {
    
    @EnvironmentObject var session: LoginViewModel
    
    @State var networkSwitch: Network = .mainnet
    
    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea(.all)
            VStack {
                HeadingButtons(networkSwitch: $networkSwitch)
                
                ScrollView {
                    VStack {
                        HStack {
                            Text("Equity (ETH)")
                                .foregroundColor(.gray)
                                .font(.system(size: 12))
                                .padding(.horizontal)
                                .padding(.bottom, 5)
                            Spacer()
                        }
                        
                        HStack {
                            Text("0.0000000")
                                .foregroundColor(Color(#colorLiteral(red: 0.9977523685, green: 0.6921175718, blue: 0.09948458523, alpha: 1)))
                                .font(.system(size: 26))
                                .fontWeight(.bold)
                                .padding(.horizontal)
                                .padding(.bottom, 1)
                            Spacer()
                        }
                        
                        HStack {
                            Text("= 0.00 USD")
                                .foregroundColor(.white)
                                .font(.system(size: 12))
                                .fontWeight(.light)
                                .padding(.horizontal)
                            Spacer()
                        }
                    }
                    
                    VStack {
                        ForEach(0...5, id: \.self) { _ in
                            HStack {
                                Text("BTC")
                                    .fontWeight(.bold)
                                Spacer()
                                VStack {
                                    Text("0.000000")
                                    Text("= 0.00 USD")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 12))
                                }
                            }
                            .padding()
                        }
                    }
                }
            }
        }
    }
}

enum Network {
    case mainnet
    case xdai
}

struct HeadingButtons: View {
    @Binding var networkSwitch: Network
    
    var body: some View {
        HStack {
            Button(action: { networkSwitch = .mainnet }) {
                Text("Ethereum")
                    .foregroundColor((networkSwitch == .mainnet) ? .white: .gray)
                    .fontWeight(.semibold)
                    .font(.system(size: 20))
                    .padding(.horizontal)
                    .padding(.top)
            }
            
            Button(action: { networkSwitch = .xdai }) {
                Text("xDai")
                    .foregroundColor((networkSwitch == .xdai) ? .white: .gray)
                    .fontWeight(.semibold)
                    .font(.system(size: 20))
                    .padding(.horizontal)
                    .padding(.top)
            }
            
        }
        
    }
}

struct AssetsView_Previews: PreviewProvider {
    static var previews: some View {
        AssetsView()
    }
}
