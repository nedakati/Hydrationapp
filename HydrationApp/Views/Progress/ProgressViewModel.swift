//
//  ProgressViewModel.swift
//  HydrationApp
//
//  Created by Katalin Neda on 29.01.2022.
//

import Foundation
import Combine
import UIKit

final class ProgressViewModel: ObservableObject {
    
    @Published var dailyIntake: Int
    @Published var targetDailyIntake: Int
    @Published var selectedUnit: Unit
    
    @Published var intakePercentage: Int = 0
    
    @Published var container1Size: Int
    @Published var container2Size: Int
    @Published var container3Size: Int

    
    init() {
        if UserStorageService.shared.lastChangeDate.getDayDifference(from: Date()) > 0 {
            UserStorageService.shared.dailyIntake = 0
        }
        
        selectedUnit = UserStorageService.shared.unit ?? .mililiter
        dailyIntake = UserStorageService.shared.dailyIntake
        targetDailyIntake = UserStorageService.shared.targetDailyIntake
        
        container1Size = UserStorageService.shared.container1
        container2Size = UserStorageService.shared.container2
        container3Size = UserStorageService.shared.container3
        
        intakePercentage = calculateDailyIntakePercentage()
    }
    
    func addedDailyIntake(_ intake: Int) {
        dailyIntake += intake
        intakePercentage = calculateDailyIntakePercentage()

        UserStorageService.shared.dailyIntake = dailyIntake
        UserStorageService.shared.lastChangeDate = Date()
    }
    
    private func calculateDailyIntakePercentage() -> Int {
        guard targetDailyIntake > 0 else { return 0 }
        return 100 * dailyIntake / targetDailyIntake
    }
}
