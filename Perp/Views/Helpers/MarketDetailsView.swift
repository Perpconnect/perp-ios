import SwiftUI
import SDWebImageSwiftUI

struct MarketDetailsView: View {
    @Binding var market: Market
    @Binding var position: Position
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(secondaryColor)
            VStack {
                HStack {
                    WebImage(url: URL(string: "https://app.perp.com/assets/coins/\(market.name.lowercased()).svg"))
                        .resizable()
                        .frame(width: 35, height: 35)
                        .padding(.trailing)
                    
                    VStack(alignment: .leading) {
                        Text("\(position.positionSize ?? "nil") \(market.name)")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                            .font(.system(size: 20))
                        
                        Text("$20,102.4")
                            .foregroundColor(Color(#colorLiteral(red: 0.4807781577, green: 0.5107654333, blue: 0.5530874133, alpha: 1)))
                            .font(.system(size: 18))
                    }
                    
                    Spacer()
                    
                    ButtonLongShort(toggle: .short)
                        .frame(width: 70, height: 35)
                    
                }
                
                RoundedRectangle(cornerRadius: 10)
                    .frame(height: 0.7)
                    .foregroundColor(Color(#colorLiteral(red: 0.4807781577, green: 0.5107654333, blue: 0.5530874133, alpha: 1)))
                
                HStack {
                    Text("Profit / Loss")
                        .foregroundColor(Color(#colorLiteral(red: 0.4807781577, green: 0.5107654333, blue: 0.5530874133, alpha: 1)))
                        .font(.system(size: 12))
                    
                    Spacer()
                    
                    Text("+30.5694")
                        .font(.system(size: 18))
                        .fontWeight(.semibold)
                        .foregroundColor(Color(#colorLiteral(red: 0.501753211, green: 0.9038555026, blue: 0.6856541038, alpha: 1)))
                }
                .padding(.bottom, 5)
                
                HStack {
                    Text("Avg. Open")
                        .foregroundColor(Color(#colorLiteral(red: 0.4807781577, green: 0.5107654333, blue: 0.5530874133, alpha: 1)))
                        .font(.system(size: 12))
                    
                    Spacer()
                    
                    Text("46,573.23")
                        .font(.system(size: 18))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                }
                
                RoundedRectangle(cornerRadius: 10)
                    .frame(height: 0.7)
                    .foregroundColor(Color(#colorLiteral(red: 0.4807781577, green: 0.5107654333, blue: 0.5530874133, alpha: 1)))
                
                Group {
                    HStack {
                        Text("Position Info")
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .padding(.top, 5)
                    
                    HStack {
                        Text("Liquidation Price")
                            .foregroundColor(Color(#colorLiteral(red: 0.4807781577, green: 0.5107654333, blue: 0.5530874133, alpha: 1)))
                            .font(.system(size: 12))
                        
                        Spacer()
                        
                        Text("46,573.23")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                    }
                    .padding(.top, 2)
                    
                    HStack {
                        Text("Account Margin Ratio")
                            .foregroundColor(Color(#colorLiteral(red: 0.4807781577, green: 0.5107654333, blue: 0.5530874133, alpha: 1)))
                        
                        Spacer()
                        
                        Text("27.33 %")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                    }
                    .padding(.top, 3)
                    
                    HStack {
                        Text("Account Leverage")
                            .foregroundColor(Color(#colorLiteral(red: 0.4807781577, green: 0.5107654333, blue: 0.5530874133, alpha: 1)))
                        
                        Spacer()
                        
                        Text("3.65x")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                    }
                    .padding(.top, 3)
                }
                .font(.system(size: 12))

            }
            .padding(20)
        }
    }
}

struct ButtonLongShort: View {
    enum Toggle: String {
        case long = "LONG"
        case short = "SHORT"
    }
    
    var toggle: Toggle = .long
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                RoundedRectangle(cornerRadius: geo.size.height * 0.50)
                    .foregroundColor(
                        toggle == .long ? Color(#colorLiteral(red: 0.2009787858, green: 0.2726232708, blue: 0.2456743419, alpha: 1)) : Color(#colorLiteral(red: 0.2684796453, green: 0.2340576649, blue: 0.2433397472, alpha: 1))
                    )
                
                Text(toggle.rawValue)
                    .font(.system(size: 12))
                    .fontWeight(.semibold)
                    .foregroundColor(
                        toggle == .long ? Color(#colorLiteral(red: 0.501753211, green: 0.9038555026, blue: 0.6856541038, alpha: 1)) :
                                .red
                    )
            }
        }
    }
}
