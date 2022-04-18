import SwiftUI

struct ChartView: View {
    
    let data: [Double]
    let maxY: Double
    let minY: Double
    
    let lineColor: Color
    
    init(data: [Double]) {
        self.data = data
        self.maxY = data.max() ?? 0
        self.minY = data.min() ?? 0
        
        let priceChange = (data.last ?? 0) - (data.first ?? 0)
        lineColor = priceChange > 0 ? Color.green : Color.red
    }
    
    var body: some View {
        VStack {
            chartView
                .frame(height: 200)
                .padding(.trailing, 60)
                .background(chartBackground)
                .overlay(chartYAxis, alignment: .trailing)
        }
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView(data: DeveloperPreview.instance.chartData)
            .preferredColorScheme(.dark)
    }
}

extension ChartView {
    
    private var chartView: some View {
        GeometryReader { geometry in
            Path { path in
                for index in data.indices {
                    
                    let xPosition = geometry.size.width / CGFloat(data.count) * CGFloat(index + 1)
                    
                    let yAxis = maxY - minY
                    
                    let yPosition = (1 - CGFloat((data[index] - minY) / yAxis)) * geometry.size.height
                    
                    if (index == 0) {
                        path.move(to: CGPoint(x: 0, y: 0))
                    }
                    path.addLine(to: CGPoint(x: xPosition, y: yPosition))
                    
                }
            }
            .stroke(lineColor, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
            .shadow(color: lineColor, radius: 10, x: 0.0, y: 10)
            .shadow(color: lineColor.opacity(0.5), radius: 30, x: 0.0, y: 30)
            .shadow(color: lineColor.opacity(0.3), radius: 50, x: 0.0, y: 50)
            .shadow(color: lineColor.opacity(0.1), radius: 100, x: 0.0, y: 100)
            
        }
    }
    
    private var chartBackground: some View {
        ZStack {
            VStack {
                Divider()
                Spacer()
                Divider()
                Spacer()
                Divider()
                Spacer()
                Divider()
                Spacer()
                Divider()
                    .frame(height: 1)
            }
            HStack {
                Group {
                    Spacer()
                    Divider()
                    Spacer()
                    Divider()
                    Spacer()
                    Group {
                        Divider()
                        Spacer()
                        Divider()
                        Spacer()
                        Divider()
                        Spacer()
                        Divider()
                        Spacer()
                    }
                }
            }
        }
    }
    
    private var chartYAxis: some View {
        VStack(alignment: .center) {
            Text(maxY.asNumberWithoutDecimals())
                .fontWeight(.medium)
            Spacer()
            Text(((maxY - (maxY - minY) * 0.25)).asNumberWithoutDecimals())
                .fontWeight(.medium)
            Spacer()
            Text(((maxY - (maxY - minY) * 0.75)).asNumberWithoutDecimals())
                .fontWeight(.medium)
            Spacer()
            Text(minY.asNumberWithoutDecimals())
                .fontWeight(.medium)
            Spacer()
        }
        .font(.system(size: 12))
    }
    
}
