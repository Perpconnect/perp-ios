import SwiftUI

enum Networks {
    case mainnet
    case arbitrium
    case optimism
    case xdai
}

struct AssetHeadingView: View {
    @Binding var networkSwitch: Networks
    
    var body: some View {
        HStack {

            Button(action: { networkSwitch = .optimism }) {
                Text("Optimism")
                    .foregroundColor((networkSwitch == .xdai) ? .white: .gray)
                    .fontWeight(.semibold)
                    .font(.system(size: 20))
                    .padding(.horizontal)
                    .padding(.top)
            }
            
        }
        
    }
}
