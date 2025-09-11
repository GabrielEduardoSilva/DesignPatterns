//
//  Adapter.swift
//  
//
//  Created by Gabriel Eduardo on 11/09/25.
//

import Foundation

protocol ViewController {
    // Intentionally unimplemented.
}

class MyViewController: ViewController {
    // Intentionally unimplemented.
}

// This is the interface that the Client code expects.
protocol AuthService {
    func presentAuthFlow(from viewController: ViewController)
}

class FacebookAuthSDK {
    func presentAuthFlow(from viewController: ViewController) {
        print("Facebook WebView has been shown.")
    }
}

class GoogleAuthSDK {
    // See that the interface is different from the Client code expected interface.
    func startAuthorization(with viewController: ViewController) {
        print("Google WebView has been shown.")
    }
}

// MARK: - Adapter

// In Swift, you don't need to create another class to create an Adapter. You can just extend an existing one.
extension GoogleAuthSDK: AuthService {
    // We are adapting the GoogleAuthSDK interface to the Client code expected interface.
    func presentAuthFlow(from viewController: ViewController) {
        print("The Adapter is called! Redirecting to the original method...")
        self.startAuthorization(with: viewController)
    }
}


extension FacebookAuthSDK: AuthService {
    // This extension just tells the compiler that both SDKs have the same interface.
}

// MARK: - Example

func startAuthorization(with service: AuthService) {
    let topViewController = MyViewController()

    service.presentAuthFlow(from: topViewController)
}

print("Starting an authorization via Facebook")
startAuthorization(with: FacebookAuthSDK())

print("Starting an authorization via Google.")
startAuthorization(with: GoogleAuthSDK())
