import SwiftUI
import MobileCoreServices
import StoreKit

struct AccountViewLoader: View {
    
    @Binding var metadata: PerpMetadataAPIModel?
    
    var body: some View {
        if (metadata != nil) {
            AccountView(vm: AccountViewModel(metadata: metadata!))
        } else {
            EmptyView()
        }
    }
    
}

struct AccountView: View {
    
    @EnvironmentObject var session: Session
    
    @ObservedObject var vm: AccountViewModel
    
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea(.all)
            ScrollView {
                
                CardView
                    .padding(10)
                    .padding(.top)
                
                ButtonOptions
                    .padding(10)
                
            }
        }
        .sheet(isPresented: $vm.showPrivateKeyView) {
            PrivateKeyView()
        }
    }
    
    var ButtonOptions: some View {
        VStack {
            Button(action: { vm.showPrivateKeyView.toggle() }) {
                CellView(image: "key", text: "Private key")
            }
            .padding(.top)
            
            Button(action: { }) {
                CellView(image: "exclamationmark.circle", text: "About Us")
            }
            .padding(.top, 30)
            
            Button(action: {
                if let scene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
                    SKStoreReviewController.requestReview(in: scene)
                }
            }) {
                CellView(image: "hand.thumbsup", text: "Rate Our App")
            }
            .padding(.top, 30)
            
            Link(destination: URL(string: "https://optimistic.etherscan.io/address/\(session.publicAddress)")!) {
                CellView(image: "link.circle", text: "Explorer")

            }
            .padding(.top, 30)
                            
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
    
    var CardView: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(.black)
                .shadow(color: .white.opacity(0.1), radius: 20, x: 10, y: 10)
            
            VStack {
                HStack {
                    Text("\(session.publicAddress.ethAddressWithDot)")
                        .foregroundColor(.white.opacity(0.7))
                        .fontWeight(.medium)
                        .font(.system(size: 16))
                        
                    Spacer()
                    
                    Text("Optimism")
                        .foregroundColor(.white.opacity(0.7))
                        .fontWeight(.medium)
                        .font(.system(size: 16))
                }
                
                VStack {
                    HStack {
                        Text("Account Value")
                            .foregroundColor(.white.opacity(0.7))
                            .fontWeight(.light)
                            .font(.system(size: 14))
                        
                        Spacer()
                    }
                    
                    HStack {
                        Text("\(vm.accountValue.asCurrencyWith2Decimals())")
                            .foregroundColor(Color.theme.orange)
                            .fontWeight(.semibold)
                            .font(.system(size: 24))
                        Spacer()
                    }
                }
                .padding(.top, 30)
                
                VStack {
                    HStack {
                        Text("Free Collateral")
                            .foregroundColor(.white.opacity(0.7))
                            .fontWeight(.light)
                            .font(.system(size: 14))
                        
                        Spacer()
                    }
                    
                    HStack {
                        Text("\(vm.freeCollateral.asCurrencyWith2Decimals())")
                            .foregroundColor(Color.theme.orange)
                            .fontWeight(.semibold)
                            .font(.system(size: 18))
                        
                        Spacer()
                    }
                }
                .padding(.top, 2)
                
            }
            .padding()
        }
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
