//
//  ContainerViewModel.swift
//  HydrationApp
//
//  Created by Katalin Neda on 29.01.2022.
//

import Foundation

final class ContainerViewModel: ObservableObject {
    
    @Published var container: Container
    @Published var selectedUnit: Unit
    
    @Published var containerSize: String
    
    init(container: Container) {
        self.container = container
        self.selectedUnit = UserStorageService.shared.unit ?? .mililiter
        
        switch container {
        case .container1:
            containerSize = "\(UserStorageService.shared.container1)"
        case .container2:
            containerSize = "\(UserStorageService.shared.container2)"
        case .container3:
            containerSize = "\(UserStorageService.shared.container3)"
        }
    }
    
    func save() {
        switch container {
        case .container1:
            UserStorageService.shared.container1 = Int(containerSize) ?? Container.container1.defaultValue
        case .container2:
            UserStorageService.shared.container2 = Int(containerSize) ?? Container.container2.defaultValue
        case .container3:
            UserStorageService.shared.container3 = Int(containerSize) ?? Container.container3.defaultValue
        }
    }
}
