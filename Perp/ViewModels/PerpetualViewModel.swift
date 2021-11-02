//
//  PerpetualViewModel.swift
//  Perp
//
//  Created by Shreyas Papinwar on 29/10/21.
//

import SwiftUI

class PerpetualViewModel {
    private var model: PerpetualModel = PerpetualModel()
    
    var markets: Array<PerpetualModel.Market> {
        return model.markets
    }
    
    
    
}
