//
//  ButtonSettingsCell.swift
//  HydrationApp
//
//  Created by Katalin Neda on 29.01.2022.
//

import SwiftUI

struct ButtonSettingsCell: View {
    
    var title: String
    var secondaryTitle: String
    
    var onButtonTapped: (() -> Void)?
    
    var body: some View {
        Button {
            onButtonTapped?()
        } label: {
            HStack {
                Text(title)
                    .foregroundColor(Color.white)
                Spacer()
                Text(secondaryTitle)
                    .font(.callout)
                    .foregroundColor(Color(.lightGray))
            }
        }
    }
}

struct ButtonSettingsCell_Previews: PreviewProvider {
    static var previews: some View {
        ButtonSettingsCell(title: "", secondaryTitle: "") {
            
        }
    }
}
