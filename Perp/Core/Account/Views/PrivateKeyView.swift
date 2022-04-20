import SwiftUI

struct PrivateKeyView: View {
    @EnvironmentObject var session: Session
    
    @State var revail = false
    
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea(.all)
            
            VStack {
                Text(revail ? session.privateKey : "*******")
                    .foregroundColor(.white)
                
                Button(action: { revail.toggle() }) {
                    HStack {
                        Image(systemName: revail ? "eye.slash" : "eye")
                    }
                    .foregroundColor(.white)
                }
            }
            
        }
    }
}

struct PrivateKeyView_Previews: PreviewProvider {
    static var previews: some View {
        PrivateKeyView()
    }
}
