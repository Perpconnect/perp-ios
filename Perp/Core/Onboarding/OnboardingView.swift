import SwiftUI

struct OnboardingView: View {
    @State var currentTab = 0
    
    @EnvironmentObject var session: Session
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color.theme.background
                    .ignoresSafeArea(.all)
                VStack {
                    TabView(selection: $currentTab) {
                        OnboardingData(title: "Made for perpetual protocol", line1: "Completely decentralized")
                            .tag(0)
                        OnboardingData(title: "Long & Short with leverage", line1: "on Optimism")
                            .tag(1)
                        OnboardingData(title: "Stake & Earn rewards", line1: "PERP")
                            .tag(2)
                    }
                    .tabViewStyle(PageTabViewStyle())
                }
                VStack {
                    HStack {
                        Spacer()
                        
                        Button("Skip") {
                            session.contentState = .Login
                        }
                            .font(.system(size: 16))
                            .foregroundColor(.white)
                            .padding(.trailing, 30)
                            .padding(.top)
                    }
                    Spacer()
                    
                    switch currentTab {
                    
                    case 1:
                        LottieView(name: "leverage", loopMode: .loop)
                            .frame(width: 200, height: 200)
                            .padding(.bottom, geo.size.height * 0.55)
                    
                    case 2:
                        LottieView(name: "stake", loopMode: .loop)
                            .frame(width: 300, height: 300)
                            .padding(.bottom, geo.size.height * 0.30)
                        
                        Button(action: { session.contentState = .Login }) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 5)
                                    .foregroundColor(Color(#colorLiteral(red: 0.9294958115, green: 0.6169720888, blue: 0.01945868507, alpha: 1)))
                                    .frame(height: 50)
                                    .padding()
                                Text("Get Started")
                                    .foregroundColor(.black)
                                    .font(.system(size: 18))
                                    .fontWeight(.semibold)
                            }
                            .padding(.bottom, geo.size.height * 0.10)
                        }
                    
                    default:
                        Image("perp_logo")
                            .resizable()
                            .frame(width: 200, height: 200)
                            .padding(.bottom, geo.size.height * 0.55)
                    }
                    
                }
            }
        }
    }
}

struct OnboardingData: View {
    var title: String
    var line1: String
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                HStack {
                    Spacer()
                    Text(title)
                        .font(.system(size: 24))
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding(.bottom)
                Text(line1)
                    .font(.system(size: 14))
                    .fontWeight(.semibold)
                    .foregroundColor(Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)))
            }
            .foregroundColor(.white)
            .padding(.top, geo.size.height * 0.55)
        }
    }
}
