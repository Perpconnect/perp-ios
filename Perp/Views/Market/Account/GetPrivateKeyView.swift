//
//  GetPrivateKeyView.swift
//  Perp
//
//  Created by Shreyas Papinwar on 06/11/21.
//

import SwiftUI

struct GetPrivateKeyView: View {
    @EnvironmentObject var session: LoginViewModel
    
    @State var revail = false
    
    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea(.all)
            
            VStack {
                Text(revail ? session.privateKey! : "*******")
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

struct GetPrivateKeyView_Previews: PreviewProvider {
    static var previews: some View {
        GetPrivateKeyView()
    }
}
