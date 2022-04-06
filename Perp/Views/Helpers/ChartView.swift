//
//  ChartView.swift
//  Perp
//
//  Created by Shreyas on 03/04/2022.
//

import SwiftUI

struct ChartView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(secondaryColor)
            Text("Soon!")
                .foregroundColor(.white)
                .font(.system(size: 18))
        }
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView()
    }
}
