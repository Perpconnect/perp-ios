import Foundation
import Web3Auth
import web3swift

enum ContentEnum {
    case Onboarding
    case Login
    case Tab
}

final class Session: ObservableObject {
    @Published var contentState: ContentEnum
    
    @Published var privateKey = UserDefaults.standard.string(forKey: "privateKey")
    @Published var publicAddress = UserDefaults.standard.string(forKey: "publicAddress") ?? "nil"
    @Published var error = ""
    
    @Published var privateKeyTextField = ""
    @Published var isLoading = false
    @Published var isShowingError = false
    
    init() {
        let privateKey = UserDefaults.standard.string(forKey: "privateKey")
        
        if (privateKey != nil && privateKey != "") {
            contentState = .Tab
        } else {
            contentState = .Onboarding
        }
    }
    
    func getPublicAddress(privateKey: String) -> String {
        
        do {
            let password = "web3swift"
            let formattedKey = privateKey.trimmingCharacters(in: .whitespacesAndNewlines)
            guard let dataKey = Data.fromHex(formattedKey) else {
                self.error = "Incorrect private key."
                self.isShowingError = true
                return ""
            }
            let keystore = try EthereumKeystoreV3(privateKey: dataKey, password: password)
            let name = "New Wallet"
            let keyData = try JSONEncoder().encode(keystore?.keystoreParams)
            guard let address = keystore?.addresses!.first!.address else {
                self.error = "Incorrect private key."
                self.isShowingError = true
                return ""
            }
            let wallet = Wallet(address: address, data: keyData, name: name, isHD: false)
            
            return wallet.address
        } catch {
            self.error = "Incorrect private key."
            self.isShowingError = true
            return ""
        }
        
    }
    
    func socialLogin(provider: Web3AuthProvider) {
        isLoading = true
        Web3Auth()
            .login(W3ALoginParams(loginProvider: provider)) {
                switch $0 {
                case .success(let result):
                    print("""
                        Signed in successfully!
                            Private key: \(result.privKey)
                            User info:
                                Name: \(result.userInfo.name)
                                Profile image: \(result.userInfo.profileImage ?? "N/A")
                                Type of login: \(result.userInfo.typeOfLogin)
                        """)
                    self.privateKey = result.privKey
                    self.publicAddress = self.getPublicAddress(privateKey: result.privKey)
                            
                    UserDefaults.standard.set(self.privateKey, forKey: "privateKey")
                    UserDefaults.standard.set(self.publicAddress, forKey: "publicAddress")
                    self.isLoading = false
                    self.contentState = .Tab
                    
                case .failure(let error):
                    self.error = "Error: \(error)"
                    self.isLoading = false
                    self.isShowingError = true
                }
            }
    }
    
    func logout() {
        self.contentState = .Login
        self.privateKey = ""
        self.publicAddress = ""
        UserDefaults.standard.set("", forKey: "privateKey")
        UserDefaults.standard.set("", forKey: "publicAddress")
    }
    
    func login() {
        
        self.publicAddress = getPublicAddress(privateKey: self.privateKeyTextField)
        
        if (self.publicAddress != "") {
            UserDefaults.standard.set(self.privateKeyTextField, forKey: "privateKey")
            UserDefaults.standard.set(self.publicAddress, forKey: "publicAddress")
            self.privateKey = self.privateKeyTextField
            self.contentState = .Tab
        }

    }
}
