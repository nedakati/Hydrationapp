//
//  DailyGoalViewModel.swift
//  HydrationApp
//
//  Created by Katalin Neda on 29.01.2022.
//

import Foundation

final class DailyGoalViewModel: ObservableObject {
    
    @Published var selectedUnit: Unit
    @Published var targetDailyIntake: String

    init() {
        selectedUnit = UserStorageService.shared.unit ?? .mililiter
        targetDailyIntake = "\(UserStorageService.shared.targetDailyIntake)"
    }
    
    func save() {
        UserStorageService.shared.targetDailyIntake = Int(targetDailyIntake) ?? 0
        NotificationCenter.default.post(name: .settingsChanged, object: nil)
    }
}
