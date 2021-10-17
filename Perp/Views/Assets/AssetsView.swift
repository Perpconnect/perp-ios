//
//  AssetsView.swift
//  Perp
//
//  Created by Shreyas Papinwar on 01/09/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct AssetsView: View {
    
    @EnvironmentObject var session: LoginViewModel
    
    @State var networkSwitch: Networks = .mainnet
    
    @ObservedObject var tokenVM: AssetViewModel
    
    func getData() {
        tokenVM.getAddressBalance(chainID: "1", address: "0x5a858FDFeb85d800753cB35b7ed254eFa7d1F8f2", currency: "USD")
    }
    
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
                            
                            Button(action: {getData()}) {
                                Image(systemName: "goforward")
                            }
                            .padding(.trailing)
                        }
                        
                        HStack {
                            Text("= \(tokenVM.totalBalanceEth) USD")
                                .foregroundColor(.white)
                                .font(.system(size: 12))
                                .fontWeight(.light)
                                .padding(.horizontal)
                            Spacer()
                        }
                    }
                    
                    VStack {
                        ForEach(tokenVM.tokens) { token in
                            HStack {
                                WebImage(url: URL(string: token.logo_url ?? ""))
                                    .resizable()
                                    .frame(width: 35, height: 35)
                                    .clipShape(Circle())
                                
                                VStack(alignment: .leading) {
                                    Text(token.contract_ticker_symbol!)
                                        .foregroundColor(.white)
                                        .fontWeight(.semibold)
                                        .padding(.bottom, 4)
                                    
                                    Text(token.contract_name!)
                                        .fontWeight(.medium)
                                        .font(.system(size: 14))
                                        .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                                    
                                }
                                .padding()
                                
                                Spacer()
                                VStack {
                                    Text("\(String(format: "%.2f", token.balance!))")
                                        .foregroundColor(.white)
                                        .padding(.bottom, 4)
                                    Text("\(String(format: "%.2f", token.amount!)) USD")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 12))
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                }
                
            }
        }
        .onAppear(perform: {
            getData()
        })
    }
}

enum Networks {
    case mainnet
    case xdai
}

struct HeadingButtons: View {
    @Binding var networkSwitch: Networks
    
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
