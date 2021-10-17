//
//  AccountView.swift
//  Perp
//
//  Created by Shreyas Papinwar on 11/09/21.
//

import SwiftUI
import MobileCoreServices

struct AccountView: View {
    
    var publicKey = UserDefaults.standard.string(forKey: "publicKey") ?? ""
    
    @EnvironmentObject var session: LoginViewModel
    
    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea(.all)
            VStack {
                Text("Hello")
                HStack {
                    Text("Hi,")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .padding(.horizontal)
                        .padding(.top)
                        .font(.system(size: 22))
                        
                    Spacer()
                }
                
                HStack {
                    Text("\(publicKey)")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .padding(.leading)
                        .font(.system(size: 18))
                    Image(systemName: "doc.on.doc")
                        .font(.system(size: 10))
                        
                    Spacer()
                }
                .onTapGesture {
                    UIPasteboard.general.setValue(publicKey, forPasteboardType: "public.plain-text")
                }
                
                Button(action: { }) {
                    CellView(image: "key", text: "Private key")
                }
                .padding(.top, 30)
                
                Button(action: { }) {
                    CellView(image: "eyedropper", text: "Color Theme")
                }
                .padding(.top, 30)
                
                Button(action: { }) {
                    CellView(image: "exclamationmark.circle", text: "About Us")
                }
                .padding(.top, 30)
                
                Button(action: { }) {
                    CellView(image: "hand.thumbsup", text: "Rate Our App")
                }
                .padding(.top, 30)
                
                Spacer()
                
                Button(action: session.logout) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                            .opacity(0.04)
                        Text("Log Out")
                    }
                    .padding()
                    .frame(height: 80)
                    .padding(.bottom, 15)
                }
                
            }
        }
        .onAppear(perform: {
            
        })
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}

struct CellView: View {
    let image: String
    let text: String
    var body: some View {
        HStack {
            Image(systemName: image)
                .padding(.leading)
            
            Text(text)
                .fontWeight(.medium)
                .padding(.leading)
            
            Spacer()
        }
    }
}
