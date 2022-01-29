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

    @UserDefaultCodable(StorageKeys.unit.rawValue)
    public var unit: Unit?
}

enum StorageKeys: String {
    case dailyIntake = "dailyIntake"
    case targetDailyIntake = "targetDailyIntake"
    case lastChangeDate = "lastChangeDate"
    case unit = "unit"
}
