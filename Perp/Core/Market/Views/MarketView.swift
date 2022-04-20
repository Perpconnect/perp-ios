import SwiftUI
import SDWebImageSwiftUI

struct MarketLoaderView: View {
    
    @Binding var market: Market?
    @Binding var metadata: PerpMetadataAPIModel?
    
    var body: some View {
        if (market != nil && metadata != nil) {
            MarketView(
                vm: MarketViewModel(
                    market: market!,
                    metadata: metadata!
                )
            )
        } else {
            ProgressView()
        }
    }
}

struct MarketView: View {
    
    @ObservedObject var vm: MarketViewModel
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            TitleView
                .padding(.top)
            
            ChartView(data: vm.chartPrices ?? [])
            
            HorizontalDivider
            
            StatsView(stats: $vm.stats, marketStats: $vm.marketStats)
            
            HorizontalDivider
            
            LongShort

            HorizontalDivider
            
            PositionDetails
            
        }
        .padding(.horizontal, 10)
        .sheet(isPresented: $vm.showPosition) {
            ClosePositionView(vm: .init(market: self.vm.market, metadata: self.vm.metadata))
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                HStack {
                    WebImage(url: URL(string: "https://app.perp.com/assets/coins/\(vm.market.name.lowercased()).svg"))
                        .resizable()
                        .frame(width: 30, height: 30)
                    Text("\(vm.market.name)")
                        .fontWeight(.semibold)
                        .font(.title3)
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        
    }
    
    private var PositionDetails: some View {
        VStack {
            HStack {
                Text("Position")
                    .fontWeight(.semibold)
                    .font(.title3)
                    .foregroundColor(.gray)
                    .padding(.leading, 5)
                
                Spacer()
            }
            
            HStack {
                WebImage(url: URL(string: "https://app.perp.com/assets/coins/\(vm.market.name.lowercased()).svg"))
                    .resizable()
                    .frame(width: 30, height: 30)
                
                VStack(alignment: .leading) {
                    Text("\(vm.position?.size?.asNumberWithoutDecimals() ?? "-") \(vm.market.name)")
                        .fontWeight(.semibold)
                        .font(.title3)
                    Text("\(vm.position?.openNotional?.asCurrencyWith2Decimals() ?? "$0.000")")
                        .foregroundColor(.gray)
                        .font(.system(size: 16))
                }
                .padding(.leading, 5)
                
                Spacer()
                
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .foregroundColor(Color.red.opacity(0.25))
                    
                    Text("SHORT")
                        .fontWeight(.bold)
                        .font(.system(size: 11))
                        .foregroundColor(.white.opacity(0.6))
                }
                .frame(width: 70, height: 30)
                
            }
            .padding(.horizontal, 10)
            
            HorizontalDivider
            
            HStack {
                Text("Profit / Loss")
                    .font(.system(size: 13))
                    .foregroundColor(.gray)
                    .fontWeight(.medium)
                Spacer()
                Text("\(vm.marketStats?.unRealisedPnl?.asNumberWithoutDecimals() ?? "-")")
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                    .foregroundColor(
                        ((vm.marketStats?.unRealisedPnl ?? 0.0) > 0) ?
                            .green : .red
                    )
                
            }
            .padding(.horizontal, 10)
            .padding(.top, 5)
            
            HStack {
                Text("Avg. Open Price")
                    .font(.system(size: 13))
                    .foregroundColor(.gray)
                    .fontWeight(.medium)
                Spacer()
                Text("\(vm.position?.avgOpenPrice ?? 0.0)")
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
            }
            .padding(.horizontal, 10)
            .padding(.top, 5)
            
            HorizontalDivider
                .padding(.horizontal, 5)
            
            Group {
                HStack {
                    Text("Liquadation Price")
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                        .fontWeight(.medium)
                    Spacer()
                    Text("-") // \(vm.position?.liqPrice ?? 0.0)
                        .font(.system(size: 14))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                }
                .padding(.horizontal, 10)
                .padding(.top, 5)
                
                HStack {
                    Text("Account Margin Ratio")
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                        .fontWeight(.medium)
                    Spacer()
                    Text("\(( ((vm.accountValue ?? 0.0) / (vm.position?.allPosValues ?? 0.0)) ).asNumberWithoutDecimals() )%")
                        .font(.system(size: 14))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                }
                .padding(.horizontal, 10)
                .padding(.top, 5)
                
                HStack {
                    Text("Account Leverage")
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                        .fontWeight(.medium)
                    Spacer()
                    Text("\(( ((vm.position?.allPosValues ?? 0.0) / (vm.accountValue ?? 0.0))).asNumberWithoutDecimals() )x")
                        .font(.system(size: 14))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                }
                .padding(.horizontal, 10)
                .padding(.top, 5)
            }
            
            HorizontalDivider
            
            Button(action: {  }) { // vm.showPosition.toggle()
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.white)
                        .opacity(0.07)
                    Text("Close")
                }
                .padding()
                .frame(height: 80)
                .padding(.bottom, 15)
            }
        }
    }
    
    private var LongShort: some View {
        HStack {
            OrderButton(type: .long)
                .frame(height: 50)
                .frame(maxWidth: .infinity)
            OrderButton(type: .short)
                .frame(maxWidth: .infinity)
        }
    }
    
    private var HorizontalDivider: some View {
        Divider()
            .frame(height: 0.5)
            .background(Color.gray)
            .padding(.horizontal, 5)
            .padding(.vertical, 2)
    }
    
    private struct StatsView: View {
        
        @Binding var stats: GetStatisticsQuery.Data.GetStatistic?
        @Binding var marketStats: MarketStatistics?
        
        var body: some View {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    StatColumn(keys: ["Mark", "Index", "Funding Rate (24H)"],
                               values: [
                                    "\(marketStats?.markPrice?.asCurrencyWith6Decimals() ?? "-")",
                                    "\(marketStats?.indexPrice?.asCurrencyWith6Decimals() ?? "-")",
                                    "\(marketStats?.fundingRate?.asCurrencyWith6Decimals() ?? "--")%"
                               ]
                    )
                    .padding(.leading)
                    
                    
                    Divider()
                        .frame(width: 0.5)
                        .background(Color.gray)
                        .padding(.horizontal, 5)
                    
                    StatColumn(keys: ["High (24H)", "Low (24H)", "Vol (24H)"],
                               values: [
                                "\((Double(stats?.priceHigh24h ?? "0.0") ?? 0.0).asNumberWithoutDecimals())",
                                    "\((Double(stats?.priceLow24h ?? "0.0") ?? 0.0).asNumberWithoutDecimals())",
                                    "\((Double(stats?.volume24h ?? "0.0") ?? 0.0).kmFormatted)"
                               ]
                    )
                    
                }
            }
        }
    }
    
    private struct StatColumn: View {
        var keys: [String]
        var values: [String]
        
        var body: some View {
            VStack {
                ForEach(0..<keys.count, id: \.self) { pos in
                    StatRow(key: keys[pos], value: values[pos])
                }
            }
            .frame(minWidth: 140, maxWidth: 230)
        }
    }
    
    private struct StatRow: View {
        var key: String
        var value: String
        
        var body: some View {
            HStack {
                Text(key)
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                    .fontWeight(.medium)
                Spacer()
                Text(value)
                    .font(.system(size: 12))
                    .fontWeight(.medium)
            }
            .padding(.top, 1)
        }
    }
    
    private var TitleView: some View {
        VStack {
            HStack {
                Text("\(Globals.Variables.marketFullNames[vm.market.name] ?? "")")
                    .font(.title2)
                    .fontWeight(.medium)
                Spacer()
            }
            
            Divider()

            HStack {
                Text("\(vm.marketStats?.indexPrice?.asCurrencyWith6Decimals() ?? "-")")
                    .font(.system(size: 18))
                    .fontWeight(.semibold)
                    .padding(.trailing, 5)
                
                Text("\(((Double(vm.stats?.priceChangeRate24h ?? "0.0") ?? 0.0) * 100).asPercentString())")
                    .font(.system(size: 14))
                    .foregroundColor(
                        (vm.market.percentChange24H > 0) ?
                        .green :
                        .red
                    )
                Spacer()
            }

        }
    }
}
