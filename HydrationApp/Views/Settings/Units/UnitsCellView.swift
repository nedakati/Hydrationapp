//
//  UnitsCellView.swift
//  HydrationApp
//
//  Created by Katalin Neda on 29.01.2022.
//

import SwiftUI

struct UnitsCellView: View {
    
    var unit: Unit
    var isSelected: Bool
    var onUnitSelected: (() -> Void)?
    
    var body: some View {
        Button {
            onUnitSelected?()
        } label: {
            HStack{
                Text(unit.title)
                Spacer()
                if isSelected {
                    Image(Images.checkmark.rawValue, bundle: nil)
                        .resizable()
                        .frame(width: 30, height: 30)
                }
            }
        }
    }
}

struct UnitsCellView_Previews: PreviewProvider {
    static var previews: some View {
        UnitsCellView(unit: .ounces, isSelected: true)
    }
}
