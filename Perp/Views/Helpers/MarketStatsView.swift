//
//  MarketStatsView.swift
//  Perp
//
//  Created by Shreyas on 03/04/2022.
//

import SwiftUI

struct MarketStatsView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(secondaryColor)
            VStack {
                MarketStatCell(key: "Mark Price", value: "97.7101")
                MarketStatCell(key: "Index Price", value: "97.7101")
                MarketStatCell(key: "Funding Rate (1h)", value: "97.7101")
                MarketStatCell(key: "Change (24h)", value: "97.7101")
                MarketStatCell(key: "Volume (24h)", value: "97.7101")
                
            }
            .padding()
            .padding(.vertical, 5)
        }
    }
}

struct MarketStatCell: View {
    var key: String
    var value: String
    var body: some View {
        HStack {
            Text(key)
                .foregroundColor(Color(#colorLiteral(red: 0.4964699745, green: 0.5264526606, blue: 0.5773087144, alpha: 1)))
                .font(.system(size: 12))
            Spacer()
            Text(value)
                .foregroundColor(.white)
                .font(.system(size: 14))
        }
        .padding(.vertical, 3)
    }
}

struct MarketStatsView_Previews: PreviewProvider {
    static var previews: some View {
        MarketStatsView()
    }
}
