//
//  HydrationAppApp.swift
//  HydrationApp
//
//  Created by Katalin Neda on 25.01.2022.
//

import SwiftUI

@available(iOS 14.0, *)
@main
struct HydrationAppApp: App {
    
    init() {
        UITabBar.appearance().backgroundColor = .backgroundColor
        UITabBar.appearance().unselectedItemTintColor = .white        
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
