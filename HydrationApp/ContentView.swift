//
//  ContentView.swift
//  HydrationApp
//
//  Created by Katalin Neda on 25.01.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Text("Today").tabItem {
                Image(Images.today.rawValue, bundle: Bundle.main)
                Text("Today")
                    .foregroundColor(Color.white)
            }.tag(1)
            Text("History").tabItem {
                Image(Images.history.rawValue, bundle: Bundle.main)
                Text("History")
            }.tag(2)
        }
        .accentColor(Color(.lightGreen))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
