//
//  ContentView.swift
//  Perp
//
//  Created by Shreyas Papinwar on 09/08/21.
//

import SwiftUI

struct ContentView: View {
    @State var showOnboarding = true
    @EnvironmentObject private var session: Session
    
    var body: some View {
        ZStack {
            switch session.contentState {
            case .Onboarding:
                OnboardingView()

            case .Login:
                LoginView()

            case .Tab:
                Tab()
        }
    }
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
