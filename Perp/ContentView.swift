//
//  ContentView.swift
//  Perp
//
//  Created by Shreyas Papinwar on 09/08/21.
//

import SwiftUI


struct ContentView: View {
    @ObservedObject var session = LoginViewModel()
    
    var body: some View {
        ZStack {
            if (session.privateKey == nil || session.privateKey == "")  {
                LoginView()
            } else {
                Tab()
            }
        }
        .environmentObject(session)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
