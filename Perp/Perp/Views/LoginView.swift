//
//  ContentView.swift
//  Perp
//
//  Created by Shreyas Papinwar on 09/08/21.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        GeometryReader { geo in
            ZStack {
                VStack {
                    Image("perp_logo")
                        .resizable()
                        .frame(width: 100, height: 100)
                    Text("Perp Connect")
                        .font(.title)

                    HStack {
                        Text("Sign in with")
                            .padding(.leading, geo.size.width * 0.05)
                            .foregroundColor(Color(#colorLiteral(red: 0.3615116477, green: 0.4246198237, blue: 0.4969069362, alpha: 1)))
                        Spacer()
                    }
                    .padding(.top, geo.size.width * 0.05)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(#colorLiteral(red: 0.6480259299, green: 0.6540077329, blue: 0.6690028906, alpha: 1)), lineWidth: 1)
                            .foregroundColor(.white)
                            .frame(width: geo.size.width * 0.90, height: 65)
                            
                        HStack {
                            Image("google")
                                .resizable()
                                .frame(width: 30, height: 30)
                            Text("Continue with Google")
                                .foregroundColor(Color(#colorLiteral(red: 0.3615116477, green: 0.4246198237, blue: 0.4969069362, alpha: 1)))
                        }
                        
                    }
                    
                    HStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(#colorLiteral(red: 0.6480259299, green: 0.6540077329, blue: 0.6690028906, alpha: 1)), lineWidth: 1)
                                .foregroundColor(.white)
                                .frame(height: 65)
                            
                            Image(systemName: "applelogo")
                                .resizable()
                                .frame(width: 25, height: 30)
                        }
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(#colorLiteral(red: 0.6480259299, green: 0.6540077329, blue: 0.6690028906, alpha: 1)), lineWidth: 1)
                                .foregroundColor(.white)
                                .frame(height: 65)
                            
                            Image("twitter")
                                .resizable()
                                .frame(width: 50, height: 30)
                        }
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(#colorLiteral(red: 0.6480259299, green: 0.6540077329, blue: 0.6690028906, alpha: 1)), lineWidth: 1)
                                .foregroundColor(.white)
                                .frame(height: 65)
                            
                            Image("discord")
                                .resizable()
                                .frame(width: 50, height: 30)
                        }
                    }
                    .frame(width: geo.size.width * 0.90)
                    
                    HStack {
                        Spacer()
                        Text("Powered by")
                            .font(.body)
                            .foregroundColor(Color(#colorLiteral(red: 0.3615116477, green: 0.4246198237, blue: 0.4969069362, alpha: 1)))
                        Image("torus")
                            .resizable()
                            .frame(width: 65, height: 30)
                    }
                    .padding(.trailing, geo.size.width * 0.05)
                    
                    Text("OR")
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(#colorLiteral(red: 0.6480259299, green: 0.6540077329, blue: 0.6690028906, alpha: 1)), lineWidth: 1)
                            .foregroundColor(.white)
                            .frame(width: geo.size.width * 0.90, height: 60)
                        
                        Text("Continue with private key")
                    }
                    .padding()
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
