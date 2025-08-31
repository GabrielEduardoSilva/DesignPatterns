# Singleton – iOS Conceptual Example with Simple Storage

This project demonstrates the **Singleton design pattern** in a minimal, abstract, and didactic way using concepts familiar to iOS developers. It showcases how a single, globally accessible instance can manage shared state without requiring multiple object creations.

## 📐 Context

In real-world iOS apps, there are scenarios where maintaining a single shared instance is more efficient, safe, and easier to manage. Instead of instantiating the same object multiple times, the Singleton pattern centralizes access to a unique instance.

Some common examples where Singletons are useful in iOS apps:

- Storing user session data. Ex.: Tokens, authentication state, user preferences.
- Managing centralized services. Ex.: Networking layers, analytics, push notification handlers.
- Coordinating global resources. Ex.: Caching, image loading, database access.
- Handling shared system objects. Ex.: FileManager.default, UserDefaults.standard, URLSession.shared.

In this conceptual example, we demonstrate a simple in-memory storage system that behaves similarly to UserDefaults, but is entirely ephemeral and not persisted to disk.

## 🧠 Pattern Roles
| Role                | Implementation              |
|---------------------|-----------------------------|
| Singleton           | `SimpleStorage`       |
| Client              | Example usage at the bottom |


## 🧪 Example Usage
```swift
SimpleStorage.shared.set("GabrielEduardo", forKey: "username")
SimpleStorage.shared.set(true, forKey: "isLoggedIn")

print(SimpleStorage.shared.get(forKey: "username")!)   // "GabrielEduardo"
print(SimpleStorage.shared.get(forKey: "isLoggedIn")!) // true
```

### Output
```
Optional("GabrielEduardo")
Optional(true)
```

## 📌 Benefits Illustrated

✅ You can be sure that a class has only a single instance across the entire app.

✅ Global access point: Any part of the app can access the shared instance without passing dependencies manually.

✅ The object is created once and reused, saving memory and setup costs.

## ⚠️ Drawbacks

❗️ Global state: Excessive reliance on singletons can make code harder to test and reason about.

❗️ Components that depend directly on a Singleton become harder to decouple or reuse.

❗️ If not designed carefully, simultaneous reads/writes on a Singleton’s state can cause race conditions.

## 🧱 File Overview
All logic is contained in a single file for clarity and portability:
Singleton.swift

You can run this file in a Swift Playground, a command-line project, or reuse it as a conceptual reference when designing global storages in iOS apps.

## 👨‍💻 Author
Created by Gabriel Eduardo on August 29, 2025.
