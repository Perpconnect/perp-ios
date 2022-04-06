//
//  ChartToggleView.swift
//  Perp
//
//  Created by Shreyas on 03/04/2022.
//

import SwiftUI

struct ChartToggleView: View {
    
    @Binding var toggle: String
    
    var options = ["Stats", "Chart"]
    
    var body: some View {
        ZStack {
            HStack {
                Picker("", selection: $toggle) {
                    ForEach(options, id: \.self) {
                       Text($0)
                           .foregroundColor(.white)
                   }
                }
                .pickerStyle(.segmented)
                .colorMultiply(.white)
            }
        }
    }
}

struct ChartToggleView_Previews: PreviewProvider {
    @State static var toggle = "Stats"
    static var previews: some View {
        ChartToggleView(toggle: $toggle)
    }
}
