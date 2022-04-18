import SwiftUI

struct MarketsView: View {
    
    @EnvironmentObject private var marketsViewModel: MarketsViewModel
    
    @State private var selectedMarket: Market? = nil
    @State private var showMarketDetailView: Bool = false

    var body: some View {
        NavigationView {
            ZStack {
                if #available(iOS 15.0, *) {
                    ListView
                    .searchable(text: $marketsViewModel.search)
                } else {
                    ListView
                }
            }
            .background(
                NavigationLink(
                    destination: MarketLoaderView(
                        market: $selectedMarket,
                        metadata: $marketsViewModel.perpMetadata
                    ),
                    isActive: $showMarketDetailView,
                    label: { EmptyView() }
                )
            )
            .navigationTitle("Markets")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { }) {
                        Image(systemName: "person.circle")
                            .foregroundColor(.gray)
                    }
                }
//                ToolbarItem(placement: .bottomBar) {
//                    HStack {
//                        Image("perp_full_black")
//                            .renderingMode(.template)
//                            .aspectRatio(contentMode: .fill)
//                            .foregroundColor(.gray)
//                        
//                        Spacer()
//                    }
//                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    private func segue(market: Market) {
        selectedMarket = market
        showMarketDetailView.toggle()
    }
    
    private var ListView: some View {
        List {
            ForEach((marketsViewModel.search == "") ?
                    marketsViewModel.allMarkets :
                    marketsViewModel.filteredMarkets
            ) { market in
                ZStack {
                    MarketRowView(market: market)
                        .onTapGesture {
                            segue(market: market)
                        }
                        .buttonStyle(PlainButtonStyle())
                }
                .listRowInsets(.init(top: 15, leading: 15, bottom: 15, trailing: 15))
            }
        }
        .listStyle(.plain)
    }
    
    
    
}

struct MarketsView_Previews: PreviewProvider {
    static var previews: some View {
        MarketsView()
            .preferredColorScheme(.dark)
            .environmentObject(dev.MarketsVM)
    }
}
