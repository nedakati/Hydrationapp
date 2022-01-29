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
    
    init() {
        selectedUnit = UserStorageService.shared.unit ?? .mililiter
        let shortTitle = UserStorageService.shared.unit?.shortTitle ?? Unit.mililiter.shortTitle
        targetDailyIntake = "\(UserStorageService.shared.targetDailyIntake) \(shortTitle)"
    }
    
    func reloadData() {
        selectedUnit = UserStorageService.shared.unit ?? .mililiter
        targetDailyIntake = "\(UserStorageService.shared.targetDailyIntake) \(selectedUnit.shortTitle)"
    }
}
