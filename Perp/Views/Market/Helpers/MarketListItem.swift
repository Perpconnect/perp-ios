//
//  MarketListItem.swift
//  Perp
//
//  Created by Shreyas Papinwar on 14/08/21.
//

import SwiftUI

struct MarketListItem: View {
    
    var market: PerpetualModel.Market
    
    var body: some View {
        HStack {
            Image(market.amm.symbol)
                .resizable()
                .frame(width: 35, height: 35)
                .padding(.trailing)
            VStack(alignment: .leading) {
                Text(market.amm.symbol)
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
                Text("")
                    .font(.system(size: 12))
                    .foregroundColor(Color(#colorLiteral(red: 0.482352972, green: 0.482286036, blue: 0.4909058213, alpha: 1)))
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
    }
}
