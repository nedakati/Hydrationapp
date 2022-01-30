//
//  HistoryCellView.swift
//  HydrationApp
//
//  Created by Katalin Neda on 30.01.2022.
//

import SwiftUI

struct HistoryCellView: View {
    
    var item: DailyIntakeEntity
    
    var unit: Unit
    var targetIntake: Int

    var date: String
    var percantageReached: Int
    var didReachDailyGoal: Bool
    
    init(item: DailyIntakeEntity) {
        self.item = item
        self.unit = UserStorageService.shared.unit ?? .mililiter
        self.targetIntake = UserStorageService.shared.targetDailyIntake

        self.date = item.date?.formatted(style: .dayLong) ?? ""
        self.date += ", "
        self.date += item.date?.formatted(style: .dayMonth) ?? ""
        
        let targetDailyIntake = UserStorageService.shared.targetDailyIntake
        if targetDailyIntake > 0 {
            percantageReached = 100 * Int(item.intake) / targetDailyIntake
        } else {
            percantageReached = 0
        }

        didReachDailyGoal = item.intake >= targetDailyIntake
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text(date)
                    .font(.callout)
                    .foregroundColor(Color(.lightGray))
                
                Text("\(item.intake) \(unit.shortTitle)")
                    .font(.title)
                
                HStack(spacing: 0) {
                    Text("\(percantageReached)% ")
                        .foregroundColor(.white)
                        .font(.bold(.body)())
                    Text("out of \(targetIntake) \(unit.shortTitle) Goal")
                        .foregroundColor(Color(.lightGray))
                        .font(.callout)
                }
            }
            if didReachDailyGoal {
                Spacer()
                Image(Images.checkmark.rawValue, bundle: nil)
            }
        }
    }
}
