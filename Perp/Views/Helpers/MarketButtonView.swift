//
//  MarketButtonView.swift
//  Perp
//
//  Created by Shreyas on 03/04/2022.
//

import SwiftUI

struct MarketButtonView: View {
    
    enum LongShort: String {
        case long = "Long"
        case short = "Short"
    }
    
    var toggle: LongShort = .long
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(secondaryColor)
            
            HStack {
                Image(systemName: toggle == .long ? "arrow.up.right.circle.fill" : "arrow.down.left.circle.fill")
                    .foregroundColor(toggle == .long ? Color(#colorLiteral(red: 0.287226975, green: 0.7988256812, blue: 0.6287472248, alpha: 1)) : Color(#colorLiteral(red: 0.9194362164, green: 0.3821258545, blue: 0.382348597, alpha: 1)))
                    .font(.system(size: 30))
                
                Text(toggle.rawValue)
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
            }
        }
    }
}

struct MarketButtonView_Previews: PreviewProvider {
    static var previews: some View {
        MarketButtonView()
    }
}
