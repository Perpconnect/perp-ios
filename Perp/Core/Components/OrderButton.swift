import SwiftUI

struct OrderButton: View {
    
    enum Order {
        case long
        case short
    }
    
    var type: Order

    var body: some View {
        ZStack {
            HStack {
                switch type {
                case .long:
                    Image(systemName: "arrow.up.right.circle.fill")
                        .foregroundColor(Color.green)
                    Text("Long")
                        .fontWeight(.semibold)
                        .foregroundColor(Color.green)
                case .short:
                    Image(systemName: "arrow.down.right.circle.fill")
                        .foregroundColor(Color.red)
                    Text("Short")
                        .fontWeight(.semibold)
                        .foregroundColor(Color.red)
                }
            }
            .font(.system(size: 20))
        }
        .padding(.horizontal, 5)
    }
}

struct OrderButton_Previews: PreviewProvider {
    static var previews: some View {
        OrderButton(type: .long)
            .preferredColorScheme(.dark)
    }
}
