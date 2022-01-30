//
//  DateFormatters.swift
//  HydrationApp
//
//  Created by Katalin Neda on 30.01.2022.
//

import Foundation

enum DateStyle {
    case dayMonth
    case dayLong
}

private struct DateFormatters {
    
    /// "3. October"
    static let dayMonth: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd. MMMM"
        
        return formatter
    }()
    
    /// Saturday
    static let dayLong: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        
        return formatter
    }()
}

extension Date {
    
    func formatted(style: DateStyle) -> String {
        let formatter: DateFormatter
        
        switch style {
        case .dayMonth:
            formatter = DateFormatters.dayMonth
        case .dayLong:
            formatter = DateFormatters.dayLong
        }
        
        return formatter.string(from: self)
    }
}
