import SwiftUI
import SDWebImageSwiftUI

struct MarketView: View {

    @ObservedObject var viewModel: MarketViewModel
    
    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea(.all)
            VStack {
                MarketHeadingView(name: $viewModel.market.name)
                ScrollView {
                    
                    ChartToggleView(toggle: $viewModel.toggle)
                        .padding(.horizontal)
                        .frame(width: 200, alignment: .leading)
                        .padding(.top)
                    
                    if viewModel.toggle == "Chart" {
                        ChartView()
                            .frame(height: 200)
                            .padding()
                    } else {
                        MarketStatsView()
                            .padding()
                    }
                    
                    HStack {
                        Button(action: { print("Long") }) {
                            MarketButtonView(toggle: .long)
                        }
                        
                        Button(action: { print("Long") }) {
                            MarketButtonView(toggle: .short)
                        }
                    }
                    .padding(.horizontal)
                    .frame(height: 70)
                    
                    MarketDetailsView(market: $viewModel.market, position: $viewModel.position)
                        .padding()
                }
            }
        }
        .navigationBarHidden(true)
        .onAppear {
            viewModel.onAppear()
        }
    }
}

struct MarketView_Previews: PreviewProvider {
    static var previews: some View {
        MarketView(viewModel: MarketViewModel(market: testMarketData[0]))
    }
}
