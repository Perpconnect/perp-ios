import SwiftUI
import SDWebImageSwiftUI

struct AssetsView: View {
    @ObservedObject var viewModel: AssetsViewModel
    
    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea(.all)
            VStack {
                AssetHeadingView(networkSwitch: $viewModel.network)
                ScrollView {
                    AccountCarosalView(account: viewModel.account)
                }
            }
        }
        .onAppear {
            viewModel.onAppear()
        }
    }
}

struct AssetsView_Previews: PreviewProvider {
    static var previews: some View {
        AssetsView(viewModel: AssetsViewModel(publicAddress: "0x5a858FDFeb85d800753cB35b7ed254eFa7d1F8f2", privateKey: "0x5a858FDFeb85d800753cB35b7ed254eFa7d1F8f2"))
    }
}
