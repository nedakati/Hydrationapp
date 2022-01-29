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
                Image("backgroundImage", bundle: Bundle.main)
                    .resizable()
                ProgressView()
            }
            .navigationBarTitle("Today's Progress", displayMode: .inline)
        }
    }
}

struct TodayView_Previews: PreviewProvider {
    static var previews: some View {
        TodayView()
    }
}
