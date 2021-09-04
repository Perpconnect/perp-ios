//
//  ContentView.swift
//  Perp
//
//  Created by Shreyas Papinwar on 09/08/21.
//

import SwiftUI
import TorusSwiftDirectSDK

struct LoginView: View {
    
    @EnvironmentObject var session: LoginViewModel
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                backgroundColor
                    .ignoresSafeArea()
                ProgressView()
                    .opacity(!session.isLoading ? 0 : 1)
                    .scaleEffect(2)
                    .progressViewStyle(CircularProgressViewStyle(tint: Color(#colorLiteral(red: 0.9977523685, green: 0.6921175718, blue: 0.09948458523, alpha: 1))))
                VStack {
                    HStack {
                        Image("perp_logo")
                            .resizable()
                            .frame(width: 70, height: 70)
                            .padding()
                        Spacer()
                    }
                    
                    HStack {
                        Text("Welcome to")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .padding(.leading)
                        Spacer()
                    }
                    HStack {
                        Text("perp connect")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding(.leading)
                        Spacer()
                    }

                    HStack {
                        Text("Sign in with")
                            .padding(.leading, geo.size.width * 0.05)
                            .foregroundColor(Color(#colorLiteral(red: 0.3615116477, green: 0.4246198237, blue: 0.4969069362, alpha: 1)))
                        Spacer()
                    }
                    .padding(.top, geo.size.width * 0.08)
                    
                    Button(action: { session.googleLogin() }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(#colorLiteral(red: 0.6480259299, green: 0.6540077329, blue: 0.6690028906, alpha: 1)), lineWidth: 0.5)
                                .foregroundColor(.white)
                                .background(Color(#colorLiteral(red: 0.08807069808, green: 0.08914270252, blue: 0.1188395992, alpha: 1)))
                                .frame(width: geo.size.width * 0.90, height: 55)
                                
                            HStack {
                                Image("google")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                Text("Continue with Google")
                                    .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                            }
                            
                        }
                    }
                    
                    HStack {
                        
                        Button(action: { session.appleLogin() }) {
                            SocialButton(image: "applelogo", height: 30, width: 25, systemImage: true)
                        }
                        
                        Button(action: { session.twitterLogin() }) {
                            SocialButton(image: "twitter", height: 25, width: 40)
                        }
                        
                        Button(action: { session.discordLogin() }) {
                            SocialButton(image: "discord", height: 25, width: 40)
                        }
                    
                    }
                    .frame(width: geo.size.width * 0.90)
                    
                    HStack {
                        Spacer()
                        Text("Powered by")
                            .font(.body)
                            .foregroundColor(Color(#colorLiteral(red: 0.3615116477, green: 0.4246198237, blue: 0.4969069362, alpha: 1)))
                        Image("torus_wallet")
                            .resizable()
                            .frame(width: 150, height: 16)
                            .foregroundColor(.white)
                    }
                    .padding(.trailing, geo.size.width * 0.05)
                    
                    Text("OR")
                        .foregroundColor(.white)
                        .padding(.top)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(#colorLiteral(red: 0.6480259299, green: 0.6540077329, blue: 0.6690028906, alpha: 1)), lineWidth: 0.5)
                            .foregroundColor(.white)
                            .frame(width: geo.size.width * 0.90, height: 55)
                        Text("Continue with private key")
                            .foregroundColor(.white)
                            .onTapGesture(perform: {
                                session.login(privateKey: "some", publicKey: "some")
                            })
                    }
                    .padding()
                    
                    Spacer()
                }
                .opacity(session.isLoading ? 0.1 : 1)
            }
            .onOpenURL { url in
                TorusSwiftDirectSDK.handle(url: url)
            }
        }
    }
}

struct SocialButton: View {
    var image: String
    var height: CGFloat
    var width: CGFloat
    var systemImage: Bool?
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(#colorLiteral(red: 0.6480259299, green: 0.6540077329, blue: 0.6690028906, alpha: 1)), lineWidth: 0.5)
                .foregroundColor(.white)
                .background(Color(#colorLiteral(red: 0.08807069808, green: 0.08914270252, blue: 0.1188395992, alpha: 1)))
                .frame(height: 55)
            
            if (systemImage ?? false) {
                Image(systemName: image)
                    .resizable()
                    .frame(width: width, height: height)
                    .accentColor(.white)
            } else {
                Image(image)
                    .resizable()
                    .frame(width: width, height: height)
            }
        }
    }
}
