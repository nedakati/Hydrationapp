//
//  AccentButtonStyle.swift
//  HydrationApp
//
//  Created by Katalin Neda on 25.01.2022.
//

import SwiftUI

struct AccentButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Spacer()
            configuration.label
                .padding(8)
            Spacer()
        }
        .background(Color(.lightGreen))
        .foregroundColor(.black)
        .cornerRadius(8)
        .opacity(configuration.isPressed ? 0.6 : 1)
    }
}
