//
//  Builder.swift
//  
//
//  Created by Gabriel Eduardo on 17/08/25.
//

// MARK: - Product

struct FeatureToggles {
    // Ensure that once the object is built, it cannot be modified.
    private let flags: [String: Bool]

    init(flags: [String: Bool]) {
        self.flags = flags
    }

    func isEnabled(_ key: String) -> Bool {
        return flags[key] ?? false
    }

    var description: String {
        "FeatureToggles(\(flags))"
    }
}

// MARK: - Abstract Builder

protocol FeatureToggleBuilding {
    @discardableResult func set(_ key: String, enabled: Bool) -> Self
    func build() -> FeatureToggles
}

// MARK: - Concrete Builder

final class FeatureToggleBuilder: FeatureToggleBuilding {

    private var flags: [String: Bool] = [:]

    @discardableResult
    func set(_ key: String, enabled: Bool) -> Self { // Returning `Self` allows chaining.
        flags[key] = enabled
        return self
    }

    func build() -> FeatureToggles {
        // You can do some validation here, like a validation for required keys.
        return FeatureToggles(flags: flags)
    }
}

// MARK: - Example

let toggles = FeatureToggleBuilder()
        .set("NewOnboardingFlow", enabled: true)
        .set("ExperimentalSearch", enabled: false)
        .build()

print("Toggles ->", toggles)
print("Is NewOnboardingFlow enabled? \(toggles.isEnabled("NewOnboardingFlow"))")
print("Is ExperimentalSearch enabled? \(toggles.isEnabled("ExperimentalSearch"))")
print("Is DarkMode enabled? \(toggles.isEnabled("DarkMode"))") // Not defined.
