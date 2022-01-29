//
//  UnitsViewModel.swift
//  HydrationApp
//
//  Created by Katalin Neda on 29.01.2022.
//

import Foundation

final class UnitsViewModel: ObservableObject {
    
    @Published var selectedUnit: Unit
    
    init() {
        selectedUnit = UserStorageService.shared.unit ?? .mililiter
    }
    
    func didSelectUnit(_ unit: Unit) {
        selectedUnit = unit
        UserStorageService.shared.unit = unit
    }
}
