import SwiftUI
import SDWebImageSwiftUI

struct MarketListCellView: View {
    
    @ObservedObject var viewModel: MarketListCellViewModel
        
    var body: some View {
        HStack {
            
            WebImage(url: URL(string: "https://app.perp.com/assets/coins/\(viewModel.market.symbol.lowercased()).svg"))
                .resizable()
                .frame(width: 35, height: 35)
                .padding(.trailing)
            VStack(alignment: .leading) {
                Text(viewModel.market.symbol)
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                Text(viewModel.market.pair)
                    .font(.system(size: 12))
                    .foregroundColor(Color(#colorLiteral(red: 0.482352972, green: 0.482286036, blue: 0.4909058213, alpha: 1)))
            }
            Spacer()
            
            if (viewModel.price == nil) {
                ProgressView()
            } else {
                VStack(alignment: .leading) {
                    Text("\(viewModel.price ?? 0.0)")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    Text("")
                        .font(.system(size: 12))
                        .foregroundColor(Color(#colorLiteral(red: 0.482352972, green: 0.482286036, blue: 0.4909058213, alpha: 1)))
                }
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
    }
}
