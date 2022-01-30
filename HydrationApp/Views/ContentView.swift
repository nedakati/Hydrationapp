//
//  ContentView.swift
//  HydrationApp
//
//  Created by Katalin Neda on 25.01.2022.
//

import SwiftUI

struct ContentView: View {

    let persistenceController = PersistenceController.shared
    
    var body: some View {
        TabView {
            TodayView()
            .environment(\.managedObjectContext, persistenceController.container.viewContext)
            .tabItem {
                Image(Images.today.rawValue, bundle: Bundle.main)
                Text("Today")
                    .foregroundColor(Color.white)
            }
            .foregroundColor(.white)
            .tag(1)
            HistoryView()
            .environment(\.managedObjectContext, persistenceController.container.viewContext)
            .tabItem {
                Image(Images.history.rawValue, bundle: Bundle.main)
                Text("History")
            }
            .tag(2)
        }
        .preferredColorScheme(.dark)
        .accentColor(Color(.lightGreen))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
