//
//  AssetsView.swift
//  Perp
//
//  Created by Shreyas Papinwar on 01/09/21.
//

import SwiftUI

struct AssetsView: View {
    
    @EnvironmentObject var session: LoginViewModel
    
    var body: some View {
        Button(action: session.logout) {
            Text("Logout")
        }
    }
}

struct AssetsView_Previews: PreviewProvider {
    static var previews: some View {
        AssetsView()
    }
}
