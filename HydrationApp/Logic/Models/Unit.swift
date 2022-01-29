//
//  Unit.swift
//  HydrationApp
//
//  Created by Katalin Neda on 29.01.2022.
//

import Foundation

enum Unit: Codable {
    case mililiter
    case ounces
}

extension Unit {
    
    var title: String {
        switch self {
        case .mililiter: return "mililiters (ml)"
        case .ounces: return "ounces (oz)"
        }
    }
    
    var shortTitle: String {
        switch self {
        case .mililiter: return "ml"
        case .ounces: return "oz"
        }
    }
}
