//
//  Container.swift
//  HydrationApp
//
//  Created by Katalin Neda on 29.01.2022.
//

import Foundation

enum Container {
    case container1
    case container2
    case container3
}

extension Container {
    var title: String {
        switch self {
        case .container1: return "Container 1"
        case .container2: return "Container 2"
        case .container3: return "Container 3"
        }
    }
    
    var defaultValue: Int {
        switch self {
        case .container1: return 200
        case .container2: return 400
        case .container3: return 500
        }
    }
}
