import SwiftUI
import SDWebImageSwiftUI

struct MarketRowView: View {
    var market: Market
    
    var body: some View {
        HStack {
            WebImage(url: URL(string: "https://app.perp.com/assets/coins/\(market.name.lowercased()).svg"))
                .resizable()
                .frame(width: 30, height: 30)
                .padding(.trailing, 5)
            
            VStack(alignment: .leading) {
                Text(market.name)
                    .font(.title3)
                    .fontWeight(.semibold)
                
                Text(Globals.Variables.marketFullNames[market.name] ?? "-")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                    .fontWeight(.semibold)
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 5) {
                Text("\(market.price.asCurrencyWith2Decimals())")
                    .fontWeight(.semibold)
                    .font(.system(size: 18))
                
                ZStack(alignment: .trailing) {
                    RoundedRectangle(cornerRadius: 3)
                        .fill(
                            (market.percentChange24H > 0) ?
                            .green :
                            .red
                        )
                        .frame(width: 60, height: 20)
                    Text("\(market.percentChange24H.asPercentString())")
                        .fontWeight(.semibold)
                        .font(.system(size: 12))
                        .padding(.trailing,5)
                }
            }
        }
        .background(
            Color.black.opacity(0.00001)
        )
    }
}

//struct MarketRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        MarketRowView(vm: Market(name: "BTC", price: 46192.33, percentChange24H: -11.2))
//            .previewLayout(PreviewLayout.sizeThatFits)
//            .preferredColorScheme(.dark)
//    }
//}
