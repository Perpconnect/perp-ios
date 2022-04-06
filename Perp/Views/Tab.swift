import SwiftUI

struct Tab: View {
    init() {
        UITabBar.appearance().backgroundColor = UIColor(backgroundColor)
        UITabBar.appearance().barTintColor = UIColor(backgroundColor)
        UITabBar.appearance().isTranslucent = true
        
    }
        
    @State var selection = 0
    @EnvironmentObject var session: Session
    
    let impact = UIImpactFeedbackGenerator(style: .medium)
    
    var body: some View {
        TabView {
            MarketsView()
                .tabItem {
                    Label("Markets", systemImage: "bitcoinsign.circle.fill")
                }
            
            AssetsView(viewModel: AssetsViewModel(publicAddress: session.publicAddress, privateKey: session.privateKey))
                .tabItem {
                    Label("Account", systemImage: "creditcard.fill")
                }
            
            SettingView()
                .tabItem {
                    Label("Setting", systemImage: "gearshape.fill")
                }
        }
        .accentColor(Color(#colorLiteral(red: 0.9977523685, green: 0.6921175718, blue: 0.09948458523, alpha: 1)))
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        Tab()
    }
}
