# Adapter – iOS Conceptual Example with Authentication SDKs

This project demonstrates the **Adapter design pattern** in a minimal, abstract, and didactic way using concepts familiar to iOS developers. It shows how to reconcile incompatible interfaces so that client code can work with multiple third-party SDKs transparently.

## 📐 Context

In real-world iOS apps, it is common to integrate third-party SDKs. However, these SDKs often provide **different interfaces** for similar functionality.

For example:

The `FacebookAuthSDK` already uses the expected method signature.

The `GoogleAuthSDK` uses a different method (`startAuthorization`) that doesn’t match what the client expects.

This example demonstrates how to adapt Google’s interface to match the common protocol without modifying the SDK itself.

## 🧠 Pattern Roles

| Role    | Implementation                                        |
|---------|-------------------------------------------------------|
| Target  | `AuthService` protocol (expected by client code)      |
| Adaptee | `GoogleAuthSDK` (incompatible interface)              |
| Adapter | `GoogleAuthSDK` extension implementing `AuthService`  |
| Client  | `startAuthorization(with:)` function                  |	

## 🧪 Example Usage

```swift
print("Starting an authorization via Facebook")
startAuthorization(with: FacebookAuthSDK())

print("Starting an authorization via Google.")
startAuthorization(with: GoogleAuthSDK())
```
### Output:

```
Starting an authorization via Facebook
Facebook WebView has been shown.

Starting an authorization via Google.
The Adapter is called! Redirecting to the original method...
Google WebView has been shown.
```

## 📌 Benefits Illustrated

✅ The client only depends on a unique interface (AuthService), not on specific SDK implementations.

✅ Adding a new SDK only requires creating an adapter, not rewriting client code.

✅ In Swift, you can implement adapters with protocol extensions instead of full wrapper classes.

## ⚠️ Drawbacks

❗️ Adds an extra layer of indirection (extensions or wrapper classes).

❗️ Multiple adapters needed: Each incompatible SDK requires its own adapter implementation.

❗️ If the third-party SDK changes its API frequently, adapters need maintenance.

## 🧱 File Overview

All logic is contained in a single file for clarity and portability:
Adapter.swift

You can run this file in a Swift Playground, command-line project, or reuse it as a conceptual reference when designing SDK integrations in iOS apps.

## 👨‍💻 Author

Created by Gabriel Eduardo on September 11, 2025.
