import SwiftUI
import MobileCoreServices
import StoreKit

struct SettingView: View {
    
    @EnvironmentObject var session: Session
    
    var body: some View {
        NavigationView {
            ZStack {
                backgroundColor
                    .ignoresSafeArea(.all)
                VStack {
                    HStack {
                        Text("Hi,")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                            .padding(.horizontal)
                            .padding(.top)
                            .font(.system(size: 22))
                            
                        Spacer()
                    }
                    .padding(.top, 3)
                    
                    HStack {
                        Text("\(session.publicAddress)")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                            .padding(.leading)
                            .font(.system(size: 18))
                        Image(systemName: "doc.on.doc")
                            .font(.system(size: 10))
                            
                        Spacer()
                    }
                    .onTapGesture {
                        UIPasteboard.general.setValue(session.publicAddress, forPasteboardType: "public.plain-text")
                    }
                    
                    NavigationLink(destination: GetPrivateKeyView()) {
                        CellView(image: "key", text: "Private key")
                    }
                    .padding(.top, 30)
                    
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
            .navigationTitle("Settings")
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
