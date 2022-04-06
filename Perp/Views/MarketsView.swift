import SwiftUI

struct MarketsView: View {
    
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.shadowColor = .clear
        appearance.backgroundColor = UIColor(backgroundColor)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        
        UINavigationBar.appearance().isTranslucent = false

    }
    
    var body: some View {
        NavigationView {
            ZStack {
                backgroundColor
                    .ignoresSafeArea()
                MarketListView(viewModel: MarketListViewModel())
            }
            .navigationBarTitle("Markets")
            .navigationBarTitleDisplayMode(.inline)
        }
        .accentColor(.white)
    }
}

struct MarketsView_Previews: PreviewProvider {
    static var previews: some View {
        MarketsView()
    }
}

extension UINavigationController {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = nil
    }
}
