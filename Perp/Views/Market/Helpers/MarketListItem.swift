//
//  MarketListItem.swift
//  Perp
//
//  Created by Shreyas Papinwar on 14/08/21.
//

import SwiftUI

struct MarketListItem: View {
    
    var market: Market
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(market.amm.pair)
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                Text(market.amm.name)
                    .font(.system(size: 12))
                    .foregroundColor(Color(#colorLiteral(red: 0.482352972, green: 0.482286036, blue: 0.4909058213, alpha: 1)))
            }
            Spacer()
            VStack(alignment: .leading) {
                Text(market.markPrice)
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                Text("4.24B USD")
                    .font(.system(size: 12))
                    .foregroundColor(Color(#colorLiteral(red: 0.482352972, green: 0.482286036, blue: 0.4909058213, alpha: 1)))
            }
            Spacer()
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: 70, height: 35)
                    .foregroundColor(Color(#colorLiteral(red: 0.1674466133, green: 0.6666144133, blue: 0.3709976077, alpha: 1)))
                
                Text("+5.11%")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .font(.system(size: 12))
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
    }
}
