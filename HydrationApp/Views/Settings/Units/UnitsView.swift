//
//  Units.swift
//  HydrationApp
//
//  Created by Katalin Neda on 29.01.2022.
//

import SwiftUI

struct UnitsView: View {
       
    @ObservedObject var viewModel = UnitsViewModel()
    
    var body: some View {
        List {
            UnitsCellView(unit: .mililiter, isSelected: viewModel.selectedUnit == .mililiter, onUnitSelected: {
                viewModel.didSelectUnit(.mililiter)
            })
            UnitsCellView(unit: .ounces, isSelected: viewModel.selectedUnit == .ounces, onUnitSelected: {
                viewModel.didSelectUnit(.ounces)
            })
        }
        .navigationBarTitle("Units", displayMode: .inline)
    }
}

struct Units_Previews: PreviewProvider {
    static var previews: some View {
        UnitsView()
    }
}
