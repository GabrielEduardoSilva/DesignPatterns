//
//  Singleton.swift
//  
//
//  Created by Gabriel Eduardo on 29/08/25.
//

import Foundation

// MARK: - Singleton

final class SimpleStorage {
    
    static let shared = {
        let instance = SimpleStorage()
        // Here you can configure the instance.
        return instance
    }()
    
    private var storage: [String: Any] = [:]
    
    // Private initializer. You should always call the shared instance.
    private init() {}
    
    func set(_ value: Any, forKey key: String) {
        storage[key] = value
    }
    
    func get<T>(forKey key: String) -> T? {
        return storage[key] as? T
    }
    
    func remove(forKey key: String) {
        storage.removeValue(forKey: key)
    }
    
    func clear() {
        storage.removeAll()
    }
}

// MARK: - Example

SimpleStorage.shared.set("GabrielEduardo", forKey: "username")
SimpleStorage.shared.set(true, forKey: "isLoggedIn")

print(SimpleStorage.shared.get(forKey: "username")!)
print(SimpleStorage.shared.get(forKey: "isLoggedIn")!)
