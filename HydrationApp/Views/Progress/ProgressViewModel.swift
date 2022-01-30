//
//  ProgressViewModel.swift
//  HydrationApp
//
//  Created by Katalin Neda on 29.01.2022.
//

import Foundation
import Combine
import UIKit
import CoreData

final class ProgressViewModel: ObservableObject {

    @Published var dailyIntake: Int
    @Published var targetDailyIntake: Int
    @Published var selectedUnit: Unit
    
    @Published var intakePercentage: Int = 0
    
    var lastChangeDate: Date
    var previusDate: Date
    
    @Published var container1Size: Int
    @Published var container2Size: Int
    @Published var container3Size: Int

    init() {
        if UserStorageService.shared.lastChangeDate.isDateYesterday {
            UserStorageService.shared.dailyIntake = 0
        }
        
        selectedUnit = UserStorageService.shared.unit ?? .mililiter
        dailyIntake = UserStorageService.shared.dailyIntake
        targetDailyIntake = UserStorageService.shared.targetDailyIntake
        lastChangeDate = UserStorageService.shared.lastChangeDate
        previusDate = UserStorageService.shared.lastChangeDate
    
        container1Size = UserStorageService.shared.container1
        container2Size = UserStorageService.shared.container2
        container3Size = UserStorageService.shared.container3
        
        intakePercentage = calculateDailyIntakePercentage()
        
        NotificationCenter.default.addObserver(self, selector: #selector(didChangeUserValues), name: .settingsChanged, object: nil)
    }
    
    func addDailyIntake(_ intake: Int) {
        dailyIntake += intake
        intakePercentage = calculateDailyIntakePercentage()
        previusDate = lastChangeDate
        lastChangeDate = Date()
    
        UserStorageService.shared.dailyIntake = dailyIntake
        UserStorageService.shared.lastChangeDate = lastChangeDate
    }
    
    private func calculateDailyIntakePercentage() -> Int {
        guard targetDailyIntake > 0 else { return 0 }
        return 100 * dailyIntake / targetDailyIntake
    }
    
    @objc private func didChangeUserValues() {
        selectedUnit = UserStorageService.shared.unit ?? .mililiter
        targetDailyIntake = UserStorageService.shared.targetDailyIntake
        
        container1Size = UserStorageService.shared.container1
        container2Size = UserStorageService.shared.container2
        container3Size = UserStorageService.shared.container3
        
        intakePercentage = calculateDailyIntakePercentage()
    }
}
