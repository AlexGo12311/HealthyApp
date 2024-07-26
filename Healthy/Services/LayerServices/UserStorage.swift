//
//  UserStorage.swift
//  Healthy
//
//  Created by Alex Neumark on 26.07.2024.
//

import UIKit

public class UserStorage {
    static let shared = UserStorage()
    
    var isOnboarding: Bool {
        get { UserDefaults.standard.bool(forKey: String(describing: UserStorage())) }
        set { UserDefaults.standard.set(newValue, forKey: String(describing: UserStorage()))}
    }
    
}
