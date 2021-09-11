//
//  SetorderView.swift
//  Perp
//
//  Created by Shreyas Papinwar on 05/09/21.
//

import SwiftUI

struct SetorderView: View {
    
    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea(.all)
            
            ScrollView {
                HStack {
                    ChartButton()
                       .frame(width: 100)
                    Spacer()
                }
                .padding(.leading)
                .padding(.top, 50)
                
                HStack {
                    VStack {
                        LimitMarketSelection()
                            .frame(height: 40)
                        OrderFields()
                    }
                    VStack {
                        OrderBook()
                    }
                }
                .padding(.horizontal)
                
                HStack {
                    VStack {
                        Text("Positions (0)")
                            .fontWeight(.semibold)
                            .foregroundColor(Color(#colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)))
                    }
                    
                    VStack {
                        Text("Orders (0)")
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                    }
                    .padding(.leading)
                    
                    Spacer()
                    Image(systemName: "doc.plaintext")
                    Text("All Orders")
                }
                .font(.system(size: 12))
                .foregroundColor(.white)
                .padding(.horizontal)
                .padding(.top)
                
                Rectangle()
                    .frame(height: 0.5)
                    .foregroundColor(.white)
                    .opacity(0.3)
                
                Image(systemName: "doc.text.magnifyingglass")
                    .foregroundColor(.white)
                    .opacity(0.5)
                    .font(.system(size: 50))
                    .padding(.top, 50)
                
                Text("You have no open positions")
                    .foregroundColor(.white)
                    .opacity(0.5)
                    .font(.system(size: 14))
                    .padding(.top, 2)
                
            }
        }
        .navigationTitle("BTCUSDT")
    }
}

struct SetorderView_Previews: PreviewProvider {
    static var previews: some View {
        SetorderView()
    }
}

struct OrderBook: View {
    var body: some View {
        VStack {
            ForEach(0...5, id: \.self) { _ in
                HStack {
                    Text("--")
                    Spacer()
                    Text("--")
                }
                .foregroundColor(Color(#colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)))
                .padding(.leading)
            }
            
            HStack {
                Image(systemName: "arrow.down")
                    .font(.system(size: 14))
                Text("0.00")
                    .fontWeight(.semibold)
                Spacer()
            }
            .padding()
            .foregroundColor(Color(#colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)))
            
            ForEach(0...5, id: \.self) { _ in
                HStack {
                    Text("--")
                    Spacer()
                    Text("--")
                }
                .foregroundColor(Color(#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)))
                .padding(.leading)
            }
            HStack {
                Spacer()
                Text("Funding Rate / Countdown")
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                    .opacity(0.5)
                    .font(.system(size: 12))
                
            }
            .padding(.top, 5)
            
            HStack {
                Spacer()
                Text("0.0100% / 00:00:00")
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                    .opacity(0.7)
                    .font(.system(size: 12))
            }
        }
    }
}

struct ChartButton: View {
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .fill(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                .opacity(0.08)
            HStack {
                Image(systemName: "arrow.up.arrow.down")
                Text("Chart")
                Image(systemName: "chevron.right")
            }
            .foregroundColor(.white)
            .font(.system(size: 12))
            .padding(5)
        }
    }
}

struct LimitMarketSelection: View {
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .fill(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                .opacity(0.08)
            HStack {
                Text("Limit")
                    .padding(.leading, 5)
                Spacer()
                Image(systemName: "chevron.down")
                    .padding(.trailing, 5)
            }
            .foregroundColor(.white)
            .font(.system(size: 14))
            .padding(9)
        }
    }
}

struct OrderPriceField: View {
    
    @State var orderPrice = ""
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .fill(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                .opacity(0.08)
            HStack {
                TextField("Order Price", text: $orderPrice)
                    .foregroundColor(.white)
            }
            .foregroundColor(.white)
            .font(.system(size: 14))
            .padding(9)
        }
    }
}

struct ContractQtyField: View {
    
    @State var orderPrice = ""
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .fill(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                .opacity(0.08)
            HStack {
                TextField("Contract Qty", text: $orderPrice)
                    .foregroundColor(.white)
                Text("USD")
                    .foregroundColor(.white)
                    .padding(.trailing, 4)
            }
            .foregroundColor(.white)
            .font(.system(size: 14))
            .padding(9)
        }
    }
}

struct LongShortButton: View {
    var isLong = true
    var body: some View {
        if isLong {
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color(#colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)))
                Text("Long")
                    .foregroundColor(.white)
                    .font(.system(size: 14))
                    .fontWeight(.bold)
                    .padding(10)
            }
        } else {
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color(#colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)))
                Text("Short")
                    .foregroundColor(.white)
                    .font(.system(size: 14))
                    .fontWeight(.bold)
                    .padding(10)
            }
        }
    }
}

struct OrderFields: View {
    
    @State var order = 0
    
    var body: some View {
        VStack {
            OrderPriceField()
                .frame(height: 40)
            ContractQtyField()
                .frame(height: 40)
            ContractQtyField()
                .frame(height: 40)
            
            HStack {
                Text("Order Value")
                    .foregroundColor(.white)
                    .opacity(0.5)
                    .font(.system(size: 12))
                
                Spacer()
                
                Text("0.0000 BTC")
                    .foregroundColor(.white)
                    .font(.system(size: 12))
            }
            .padding(.top, 1)
            
            HStack {
                Text("Available")
                    .foregroundColor(.white)
                    .opacity(0.5)
                    .font(.system(size: 12))
                
                Spacer()
                
                Text("0.0000 BTC")
                    .foregroundColor(.white)
                    .font(.system(size: 12))
            }
            .padding(.top, 1)
            
            HStack {
                LongShortButton(isLong: true)
                    .frame(height: 50)
                LongShortButton(isLong: false)
                    .frame(height: 50)
            }
        }
    }
    
}
