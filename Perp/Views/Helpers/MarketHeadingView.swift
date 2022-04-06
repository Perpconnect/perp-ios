import SwiftUI
import SDWebImageSwiftUI

struct MarketHeadingView: View {
    @Binding var name: String
    var body: some View {
        HStack {
            Image(systemName: "chevron.backward")
                .padding(.leading)
                .foregroundColor(.white)
                .font(.system(size: 22))
                
            Spacer()
            
            WebImage(url: URL(string: "https://app.perp.com/assets/coins/\(name.lowercased()).svg"))
                .resizable()
                .frame(width: 25, height: 25)
            Text(name)
                .foregroundColor(.white)
                .fontWeight(.semibold)
                .padding(.trailing, 20)
            
            Spacer()
            
        }
    }
}

struct MarketHeadingView_Previews: PreviewProvider {
    @State static var nameState = "BTC"
    static var previews: some View {
        MarketHeadingView(name: $nameState)
    }
}
