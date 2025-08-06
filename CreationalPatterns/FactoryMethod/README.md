# Factory Method – iOS Conceptual Example with ViewControllers

This project demonstrates the **Factory Method design pattern** in a minimal and abstract way using native iOS concepts. The goal is to show how ViewControllers can be created through factories, decoupling the instantiation logic from the navigation or business logic layers.

## 📐 Context

In real-world iOS applications, especially in **modular architectures** (VIPER, Clean, Coordinators), it's common to separate **ViewController creation** from routing. This pattern supports **testability, encapsulation**, and **dependency injection**.

This example mirrors that setup in a minimal, didactic way:

- The **Product** is `UIViewController` (protocol-simulated here for abstraction).
- The **Factory Method** is defined by `ViewControllerFactory`.
- **Concrete factories** are implemented as enums, returning specific ViewControllers.
- The **Client** is a `Router`, responsible for navigating to different destinations.

## 🧠 Pattern Roles

| Role                 | Implementation                  |
|----------------------|----------------------------------|
| Product              | `UIViewController` protocol      |
| Concrete Products    | `OnboardingViewController`, `HomeViewController`, `ProfileViewController` |
| Creator              | `ViewControllerFactory` protocol |
| Concrete Creators    | `OnboardingFactory`, `HomeFactory`, `ProfileFactory` |
| Client               | `Router`                         |

## 🧪 Example Usage

```swift
let router = Router()
router.navigateTo(.home)
```
Internally, this calls the corresponding factory (HomeFactory) to generate the correct screen, without the router needing to know how it's built.

## 📌 Benefits Illustrated

✅ Clear separation of concerns

✅ Easy to inject presenters, interactors, and dependencies inside factories

✅ Open for extension: adding new screens requires only a new factory

✅ Useful for modular apps, Coordinators, and Feature Flags

## 🧱 File Overview

All logic is self-contained in a single file:
FactoryMethod.swift

You can copy this file into a Playground or reuse it as a reference when architecting your own UIKit modules.

## 👨‍💻 Author

Created by Gabriel Eduardo on August 6, 2025.