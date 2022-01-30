//
//  Date+Utility.swift
//  HydrationApp
//
//  Created by Katalin Neda on 29.01.2022.
//

import Foundation

extension Date {
    
    var isDateYesterday: Bool { Calendar.current.isDateInYesterday(self) }
    
    func getDayDifference(from date: Date) -> Int {
        let calendar = Calendar.current
        let dateComponents = calendar.dateComponents([.day], from: self, to: date)

        return dateComponents.day ?? 0
    }
}
