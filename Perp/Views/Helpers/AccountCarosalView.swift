import SwiftUI

struct AccountCarosalView: View {
    let account: Account
    var body: some View {
        VStack {
            
            HStack {
                Text("Account Value")
                    .foregroundColor(.gray)
                    .font(.system(size: 14))
                    .padding(.horizontal)
                    .padding(.bottom, 4)
                Spacer()
            }
            
            HStack {
                Text("$ \(account.accountValue ?? 0.0) USD")
                    .foregroundColor(Color(#colorLiteral(red: 0.9977523685, green: 0.6921175718, blue: 0.09948458523, alpha: 1)))
                    .font(.system(size: 24))
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                    .padding(.bottom, 1)
                Spacer()
            }
            
            HStack {
                Text("Free collatral")
                    .foregroundColor(.gray)
                    .font(.system(size: 14))
                    .padding(.horizontal)
                    .padding(.bottom, 4)
                Spacer()
            }
            
            HStack {
                Text("$ \(account.freeCollatral ?? 0.0) USD")
                    .foregroundColor(Color(#colorLiteral(red: 0.9977523685, green: 0.6921175718, blue: 0.09948458523, alpha: 1)))
                    .font(.system(size: 22))
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                    .padding(.bottom, 5)
                Spacer()
            }
            
            HStack {
                Text("Address")
                    .foregroundColor(.gray)
                    .font(.system(size: 14))
                    .padding(.horizontal)
                    .padding(.bottom, 5)
                Spacer()
            }
            
            HStack {
                Text(account.address ?? "nil")
                    .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.6)))
                    .font(.system(size: 22))
                    .padding(.horizontal)
                    .frame(width: 300, height: 20)
                    .truncationMode(.middle)
                    .padding(.bottom, 5)
                    .fixedSize()
                Spacer()
            }
        }
    }
}

struct AccountCarosalView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea(.all)
            VStack {
                AccountCarosalView(
                    account: Account(accountValue: 125.66,
                                    freeCollatral: 100,
                                    address: "0x5a858FDFeb85d800753cB35b7ed254eFa7d1F8f2")
                )
                Spacer()
            }
        }
    }
}
