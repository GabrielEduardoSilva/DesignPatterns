//
//  FactoryMethod.swift
//
//
//  Created by Gabriel Eduardo on 06/08/25.
//

// MARK: - Product

protocol UIViewController {
    func viewDidLoad()
}

// MARK: - Creator

protocol ViewControllerFactory {
    func makeViewController() -> UIViewController
}

// MARK: - Concrete Products

final class OnboardingViewController: UIViewController {
    func viewDidLoad() {
        print("That's the Onboarding ViewController!")
    }
}

final class HomeViewController: UIViewController {
    func viewDidLoad() {
        print("That's the Home ViewController!")
    }
}

final class ProfileViewController: UIViewController {
    func viewDidLoad() {
        print("That's the Profile ViewController!")
    }
}

// MARK: - Concrete Creators

enum OnboardingFactory: ViewControllerFactory {
    static func makeViewController() -> UIViewController {
        // You can do additional stuff, like create an Interactor, a Presenter, inject them and etc.
        return OnboardingViewController()
    }
}

enum HomeFactory: ViewControllerFactory {
    static func makeViewController() -> UIViewController {
        // You can do additional stuff, like create an Interactor, a Presenter, inject them and etc.
        return HomeViewController()
    }
}

enum ProfileFactory: ViewControllerFactory {
    static func makeViewController() -> UIViewController {
        // You can do additional stuff, like create an Interactor, a Presenter, inject them and etc.
        return ProfileViewController()
    }
}

enum RouterDestinations {
    case onboarding
    case home
    case profile
}

// MARK: - Client

final class Router {
    func navigateTo(_ destination: RouterDestinations) {
        var viewController: UIViewController?
        switch destination {
        case .onboarding:
            viewController = OnboardingFactory.makeViewController()
        case .home:
            viewController = HomeFactory.makeViewController()
        case .profile:
            viewController = ProfileFactory.makeViewController()
        }
        
        // Then you would push the new ViewController
    }
}
