# Abstract Factory – iOS Conceptual Example with Views and ViewControllers

This project demonstrates the **Abstract Factory design pattern** in a minimal, abstract, and didactic way using concepts familiar to iOS developers. It showcases how families of related UI components (Views and ViewControllers) can be instantiated via factories while keeping the client completely decoupled from concrete implementations.

## 📐 Context

In scalable iOS architectures, you often need to provide different sets of screens depending on user roles (e.g., Student vs Teacher), feature flags, or app configurations. The Abstract Factory pattern helps encapsulate these differences by letting clients work only with abstract interfaces.

This example mirrors that setup in a concise, conceptual form:

- The **Abstract Products** are `View` and `ViewController` protocols.
- **Concrete Products** are specific variations of Views and Controllers for each role.
- The **Abstract Factory** declares methods to create the Views and Controllers.
- Each **Concrete Factory** knows how to build a coherent set of UI elements.
- The **Client** receives a factory and uses it to present login or signup flows without knowing what it’s actually showing.

## 🧠 Pattern Roles

| Role                | Implementation                   |
|---------------------|-----------------------------------|
| Abstract Product A  | `View`                            |
| Abstract Product B  | `ViewController`                  |
| Concrete Products   | `StudentLoginView`, `StudentSignUpView`, `TeacherLoginView`, `TeacherSignUpView`, `TeacherViewController`, `StudentViewController` |
| Abstract Factory    | `AuthFactory` protocol            |
| Concrete Factories  | `StudentAuthFactory`, `TeacherAuthFactory` |
| Client              | `AuthPresenter`                   |

## 🧪 Example Usage

```swift
let studentPresenter = AuthPresenter(factory: StudentAuthFactory.self)
studentPresenter.present(type: .login)

let teacherPresenter = AuthPresenter(factory: TeacherAuthFactory.self)
teacherPresenter.present(type: .signUp)
```

Internally, each presenter asks the corresponding factory for the appropriate ViewController based on the AuthType, and then prints the simulated output.

## 📌 Benefits Illustrated
✅ The client never directly depends on any concrete View or ViewController.

✅ Factories ensure coherent combinations of views and controllers (e.g., StudentLoginView always comes with StudentViewController).

✅ You can add a new user role (e.g., Admin) by creating a new factory—no need to touch existing code.

✅ You can inject mock factories or stub implementations into the presenter for unit testing.

## ⚠️ Drawbacks
❗️ For every new role or screen set, a new factory is required—this can introduce boilerplate.

❗️ Abstract factories can feel verbose for small projects or cases where concrete classes are sufficient.

❗️ Concrete products must be carefully designed to work together, which can lead to accidental coupling.

## 🧱 File Overview
All logic is contained in a single file for clarity and portability:
AuthModuleFactory.swift

You can run this file in a Swift Playground, command-line project, or reuse it for reference when building modular UI architectures.

## 👨‍💻 Author
Created by Gabriel Eduardo on August 8, 2025.
