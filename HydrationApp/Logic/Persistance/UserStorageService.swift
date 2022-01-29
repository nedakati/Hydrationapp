//
//  UserStorageService.swift
//  HydrationApp
//
//  Created by Katalin Neda on 29.01.2022.
//

import Foundation

class UserStorageService {
    
    static var shared = UserStorageService()
    
    private lazy var defaults = UserDefaults()
    
    private init() { }
    
    @UserDefault(key: StorageKeys.dailyIntake.rawValue, defaultValue: 0)
    public var dailyIntake: Int
    
    @UserDefault(key: StorageKeys.targetDailyIntake.rawValue, defaultValue: 2000)
    public var targetDailyIntake: Int
    
    @UserDefault(key: StorageKeys.lastChangeDate.rawValue, defaultValue: Date())
    public var lastChangeDate: Date
    
    @UserDefault(key: StorageKeys.container1.rawValue, defaultValue: Container.container1.defaultValue)
    public var container1: Int
    
    @UserDefault(key: StorageKeys.container2.rawValue, defaultValue: Container.container2.defaultValue)
    public var container2: Int
    
    @UserDefault(key: StorageKeys.container3.rawValue, defaultValue: Container.container3.defaultValue)
    public var container3: Int

    @UserDefaultCodable(StorageKeys.unit.rawValue)
    public var unit: Unit?
}

enum StorageKeys: String {
    case dailyIntake = "dailyIntake"
    case targetDailyIntake = "targetDailyIntake"
    case lastChangeDate = "lastChangeDate"
    case unit = "unit"
    case container1 = "container1"
    case container2 = "container2"
    case container3 = "container3"
}
