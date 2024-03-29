//
//  TodayView.swift
//  HydrationApp
//
//  Created by Katalin Neda on 25.01.2022.
//

import SwiftUI

struct TodayView: View {

    var body: some View {
        NavigationView {
            ZStack {
                Image(Images.backgroundImage.rawValue, bundle: Bundle.main)
                    .resizable()
                Color.black.opacity(0.2)
                ProgressView()
            }
            .navigationBarTitle("Today's Progress", displayMode: .inline)
            .navigationBarItems(trailing:
                NavigationLink(destination: {
                   SettingsView()
                }, label: {
                    Image(Images.settings.rawValue, bundle: Bundle.main)
                        .resizable()
                })
            )
        }
    }
}

struct TodayView_Previews: PreviewProvider {
    static var previews: some View {
        TodayView()
    }
}
