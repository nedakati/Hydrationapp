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
    case short
}

private struct DateFormatters {
    
    /// "30. January"
    static let dayMonth: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd. MMMM"
        
        return formatter
    }()
    
    /// Sunday
    static let dayLong: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        
        return formatter
    }()
    
    /// "30.01.2022"
    static let short: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM"
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
        case .short:
            formatter = DateFormatters.short
        }
        
        return formatter.string(from: self)
    }
}
