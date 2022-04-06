import SwiftUI

struct MarketListView: View {
    @ObservedObject var viewModel: MarketListViewModel
    
    var body: some View {
        VStack {
            MarketListHeader()
            if (viewModel.markets.isEmpty) {
                ProgressView()
                    .scaleEffect(1.5)
                    .padding(.top)
                    .foregroundColor(.blue)
            }
            if #available(iOS 15.0, *) {
                ScrollView(showsIndicators: false) {
                    
                    ForEach(viewModel.markets) { market in
                        NavigationLink(destination: MarketView(viewModel: MarketViewModel(market: market))) {
                            MarketListCellView(viewModel: MarketListCellViewModel(market: market))
                        }
                        .padding(.vertical, 7)
                    }
                    .refreshable(action: { viewModel.onAppear() })
                }
            } else {
                ScrollView(showsIndicators: false) {
                    
                    ForEach(viewModel.markets) { market in
                        NavigationLink(destination: MarketView(viewModel: MarketViewModel(market: market))) {
                            MarketListCellView(viewModel: MarketListCellViewModel(market: market))
                        }
                        .padding(.vertical, 7)
                    }
                }
            }
        }
    }
}
