//
//  LoginViewModel.swift
//  Perp
//
//  Created by Shreyas Papinwar on 11/08/21.
//

import Combine

import TorusSwiftDirectSDK
import FetchNodeDetails
import PromiseKit
import SafariServices
import web3swift
import CryptoSwift

class LoginViewModel: ObservableObject {
    
    func googleLogin() {
        let sub = SubVerifierDetails(loginType: .installed,
                                     loginProvider: .google,
                                     clientId: "221898609709-obfn3p63741l5333093430j3qeiinaa8.apps.googleusercontent.com",
                                     verifierName: "google-lrc",
                                     redirectURL: "com.googleusercontent.apps.238941746713-vfap8uumijal4ump28p9jd3lbe6onqt4:/oauthredirect",
                                     browserRedirectURL: "https://scripts.toruswallet.io/redirect.html")
        let tdsdk = TorusSwiftDirectSDK(aggregateVerifierType: .singleLogin, aggregateVerifierName: "google-lrc", subVerifierDetails: [sub], loglevel: .trace)
        tdsdk.triggerLogin(browserType: .external).done { data in
            print("private key rebuild", data)
        }.catch{ err in
            print(err)
        }
    }
    
    func twitterLogin() {
        let sub = SubVerifierDetails(loginType: .web,
                                     loginProvider: .twitter,
                                     clientId: "A7H8kkcmyFRlusJQ9dZiqBLraG2yWIsO",
                                     verifierName: "torus-auth0-twitter-lrc",
                                     redirectURL: "perp://tdsdk/oauthCallback",
                                     jwtParams: ["domain":"torus-test.auth0.com"])
        
        let tdsdk = TorusSwiftDirectSDK(aggregateVerifierType: .singleLogin, aggregateVerifierName: "torus-auth0-twitter-lrc", subVerifierDetails: [sub])
        tdsdk.triggerLogin(browserType: .external).done { data in
            print("private key rebuild", data)
        }.catch{ err in
            print(err)
        }
    }
    
    func discordLogin() {
        let sub = SubVerifierDetails(loginType: .web,
                                     loginProvider: .discord,
                                     clientId: "700259843063152661",
                                     verifierName: "discord-shubs",
                                     redirectURL: "perp://tdsdk/oauthCallback")
        let tdsdk = TorusSwiftDirectSDK(aggregateVerifierType: .singleLogin, aggregateVerifierName: "discord-shubs", subVerifierDetails: [sub])
        tdsdk.triggerLogin(browserType: .external).done{ data in
            print("private key rebuild", data)
        }.catch{ err in
            print(err)
        }
    }
    
    func appleLogin() {
        let sub = SubVerifierDetails(loginType: .web,
                                     loginProvider: .apple,
                                     clientId: "m1Q0gvDfOyZsJCZ3cucSQEe9XMvl9d9L",
                                     verifierName: "torus-auth0-apple-lrc",
                                     redirectURL: "perp://tdsdk/oauthCallback",
                                     jwtParams: ["domain":"torus-test.auth0.com"])
        
        let tdsdk = TorusSwiftDirectSDK(aggregateVerifierType: .singleLogin, aggregateVerifierName: "torus-auth0-apple-lrc", subVerifierDetails: [sub], loglevel: .trace)
        tdsdk.triggerLogin(browserType: .external).done { data in
            print("private key rebuild", data)
        }.catch{ err in
            print(err)
        }
    }
    
}
