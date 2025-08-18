# Builder – iOS Conceptual Example with Feature Toggles

This project demonstrates the **Builder design pattern** in a minimal, abstract, and didactic way using concepts familiar to iOS developers. It showcases how complex objects (in this case, Feature Toggles) can be constructed step by step with clear, chainable methods, while ensuring immutability in the final product.

## 📐 Context

In real-world iOS apps, feature toggles are usually managed remotely (via APIs, remote config services, or experimentation platforms).
This example, however, is meant for **local testing and educational purposes only**.

The `FeatureToggleBuilder` allows you to simulate enabling or disabling features locally, illustrating how the Builder pattern can be applied in Swift:
- The **Product** is the immutable `FeatureToggles` object.
- The **Builder** provides methods to add flags step by step.
- The **Client** constructs its own toggle configuration for local testing.

This mirrors common iOS scenarios where you need to test multiple app flows locally without depending on server-side configurations.

## 🧠 Pattern Roles

| Role                | Implementation                            |
|---------------------|-------------------------------------------|
| Product             | `FeatureToggles`                          |
| Abstract Builder    | `FeatureToggleBuilding`                   |
| Concrete Builder    | `FeatureToggleBuilder`                    |
| Client              | Example usage at the bottom               |

## 🧪 Example Usage

```swift
let toggles = FeatureToggleBuilder()
    .set("NewOnboardingFlow", enabled: true)
    .set("ExperimentalSearch", enabled: false)
    .build()

print("Toggles ->", toggles)
print("Is NewOnboardingFlow enabled? \(toggles.isEnabled("NewOnboardingFlow"))")
print("Is ExperimentalSearch enabled? \(toggles.isEnabled("ExperimentalSearch"))")
print("Is DarkMode enabled? \(toggles.isEnabled("DarkMode"))") // Not defined
```

### Output:

```
Toggles -> FeatureToggles(["NewOnboardingFlow": true, "ExperimentalSearch": false])
Is NewOnboardingFlow enabled? true
Is ExperimentalSearch enabled? false
Is DarkMode enabled? false
```

## 📌 Benefits Illustrated

✅ The client code doesn’t need to deal with raw initializers or dictionaries — the builder hides construction details.

✅ You can construct the object step by step, instead of passing a huge set of parameters at once.

✅ Fluent and chainable syntax (builder.set(...).set(...).build()) for readability.

✅ Demonstrates immutability: once built, FeatureToggles cannot be changed.

✅ Testability: local builders let you simulate different toggle scenarios quickly without external services, which speeds up iteration.


## ⚠️ Drawbacks

❗️ Introduces extra layers of code (a builder type) compared to directly instantiating objects, which can feel excessive in very simple cases.

❗️ Adds verbosity: each new option requires a method in the builder, which can lead to boilerplate.

❗️ If the object being built is too simple, the builder may reduce clarity rather than increase it.

## 🧱 File Overview
All logic is contained in a single file for clarity and portability:
Builder.swift

You can run this file in a Swift Playground, command-line project, or reuse it as a conceptual reference when designing configuration builders in iOS apps.

## 👨‍💻 Author
Created by Gabriel Eduardo on August 17, 2025.
