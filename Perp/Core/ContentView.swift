import SwiftUI

struct ContentView: View {
    @State var showOnboarding = true
    @StateObject private var marketsViewModel = MarketsViewModel()
    @EnvironmentObject private var session: Session
    
    var body: some View {
        ZStack {
            switch session.contentState {
            case .Onboarding:
                OnboardingView()

            case .Login:
                LoginView()

            case .Tab:
                MarketsView()
                    .environmentObject(marketsViewModel)
        }
    }
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
