import SwiftUI

struct MarketListHeader: View {
    var body: some View {
        HStack {
            Text("Trading Pairs")
            Spacer()
            Text("Price")
            
        }
        .foregroundColor(Color(#colorLiteral(red: 0.482352972, green: 0.482286036, blue: 0.4909058213, alpha: 1)))
        .font(.system(size: 12))
        .padding(.horizontal)
        .padding(.top, 5)
    }
}

struct MarketListHeader_Previews: PreviewProvider {
    static var previews: some View {
        MarketListHeader()
    }
}
