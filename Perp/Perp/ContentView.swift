//
//  ContentView.swift
//  Perp
//
//  Created by Shreyas Papinwar on 09/08/21.
//

import SwiftUI

struct ContentView: View {
    @State private var privateKey = UserDefaults.standard.string(forKey: "privateKey")
    @State private var publicKey = UserDefaults.standard.string(forKey: "publicKey")
    
    var body: some View {
        if (privateKey != nil)  {
            LoginView(loginVM: LoginViewModel())
        } else {
            Tab()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
