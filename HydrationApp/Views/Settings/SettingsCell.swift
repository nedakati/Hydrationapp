//
//  SettingsCell.swift
//  HydrationApp
//
//  Created by Katalin Neda on 29.01.2022.
//

import SwiftUI

struct SettingsCell: View {
    
    var title: String
    var secondaryTitle: String
    
    var body: some View {
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

struct SettingsCell_Previews: PreviewProvider {
    static var previews: some View {
        SettingsCell(title: "Example", secondaryTitle: "")
    }
}
