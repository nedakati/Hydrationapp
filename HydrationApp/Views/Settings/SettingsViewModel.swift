//
//  SettingsViewModel.swift
//  HydrationApp
//
//  Created by Katalin Neda on 29.01.2022.
//

import Foundation

final class SettingsViewModel: ObservableObject {
    
    @Published var selectedUnit: Unit
    @Published var targetDailyIntake: String
    
    @Published var container1: String
    @Published var container2: String
    @Published var container3: String

    
    init() {
        selectedUnit = UserStorageService.shared.unit ?? .mililiter
        let shortTitle = UserStorageService.shared.unit?.shortTitle ?? Unit.mililiter.shortTitle
        targetDailyIntake = "\(UserStorageService.shared.targetDailyIntake) \(shortTitle)"
        
        container1 = "\(UserStorageService.shared.container1) \(shortTitle)"
        container2 = "\(UserStorageService.shared.container2) \(shortTitle)"
        container3 = "\(UserStorageService.shared.container3) \(shortTitle)"
    }
    
    func reloadData() {
        selectedUnit = UserStorageService.shared.unit ?? .mililiter
        targetDailyIntake = "\(UserStorageService.shared.targetDailyIntake) \(selectedUnit.shortTitle)"
        container1 = "\(UserStorageService.shared.container1) \(selectedUnit.shortTitle)"
        container2 = "\(UserStorageService.shared.container2) \(selectedUnit.shortTitle)"
        container3 = "\(UserStorageService.shared.container3) \(selectedUnit.shortTitle)"
    }
}
