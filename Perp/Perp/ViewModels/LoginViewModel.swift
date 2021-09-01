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
                                     clientId: "309493952136-ite5em9m18qtf26mmjfadt7rvmoetpqk.apps.googleusercontent.com",
                                     verifierName: "perp-google-testnet",       // mainnet - perp-google, testnet - perp-google-testnet
                                     redirectURL: "com.googleusercontent.apps.309493952136-ite5em9m18qtf26mmjfadt7rvmoetpqk:/oauthredirect",
                                     jwtParams: ["domain":"dev-gqod-vvp.eu.auth0.com"])
        let tdsdk = TorusSwiftDirectSDK(aggregateVerifierType: .singleLogin, aggregateVerifierName: "perp-google-testnet", subVerifierDetails: [sub], loglevel: .trace)
        tdsdk.triggerLogin(browserType: .external).done { data in
            print("private key rebuild", data)
        }.catch{ err in
            print(err)
        }
    }
    
    func twitterLogin() {
        let sub = SubVerifierDetails(loginType: .web,
                                     loginProvider: .twitter,
                                     clientId: "oUGRbIVvlttagYICChPVYfx3uTgTV6o3",
                                     verifierName: "perp-auth0-twitter",            // mainnet - perp-auth0-twitter, testnet - perp-auth0-twitter-testnet
                                     redirectURL: "perp://tdsdk/oauthCallback",
                                     jwtParams: ["domain":"dev-gqod-vvp.eu.auth0.com"])
        
        let tdsdk = TorusSwiftDirectSDK(aggregateVerifierType: .singleLogin, aggregateVerifierName: "perp-auth0-twitter", subVerifierDetails: [sub])
        tdsdk.triggerLogin(browserType: .external).done { data in
            print("private key rebuild", data)
        }.catch{ err in
            print(err)
        }
    }
    
    func discordLogin() {
        let sub = SubVerifierDetails(loginType: .web,
                                     loginProvider: .discord,
                                     clientId: "882187894482173962",
                                     verifierName: "perp-discord",       // mainnet - perp-discord, testnet - perp-discord-testnet
                                     redirectURL: "perp://tdsdk/oauthCallback")
        let tdsdk = TorusSwiftDirectSDK(aggregateVerifierType: .singleLogin, aggregateVerifierName: "perp-discord-testnet", subVerifierDetails: [sub])
        tdsdk.triggerLogin(browserType: .external).done{ data in
            print("private key rebuild", data)
        }.catch{ err in
            print(err)
        }
    }
    
    func appleLogin() {
        let sub = SubVerifierDetails(loginType: .web,
                                     loginProvider: .apple,
                                     clientId: "oUGRbIVvlttagYICChPVYfx3uTgTV6o3",
                                     verifierName: "perp-auth0-apple-testnet",
                                     redirectURL: "perp://tdsdk/oauthCallback",
                                     jwtParams: ["domain":"dev-gqod-vvp.eu.auth0.com"])
        
        let tdsdk = TorusSwiftDirectSDK(aggregateVerifierType: .singleLogin, aggregateVerifierName: "perp-auth0-apple-testnet", subVerifierDetails: [sub], loglevel: .trace)
        tdsdk.triggerLogin(browserType: .external).done { data in
            print("private key rebuild", data)
        }.catch{ err in
            print(err)
        }
    }
    
}
