//
//  AbstractFactory.swift
//  
//
//  Created by Gabriel Eduardo on 08/08/25.
//

enum AuthType {
    case login
    case signUp
}

// MARK: - Abstract Product A

protocol View {}

// MARK: - Abstract Product B

protocol ViewController {
    var view: View { get }
}

// MARK: - Abstract Factory

protocol AuthFactory {
    static func makeView(for type: AuthType) -> View
    static func makeViewController(for type: AuthType) -> ViewController
}

// MARK: - Concrete Products A

struct StudentLoginView: View {
    var description: String { "Student Login View" }
}

struct StudentSignUpView: View {
    var description: String { "Student SignUp View" }
}

struct TeacherLoginView: View {
    var description: String { "Teacher Login View" }
}

struct TeacherSignUpView: View {
    var description: String { "Teacher SignUp View" }
}

// MARK: - Concrete Products B

struct TeacherViewController: ViewController {
    let view: View
    var description: String { "Teacher Controller with \(view)" }
}

struct StudentViewController: ViewController {
    let view: View
    var description: String { "Student Controller with \(view)" }
}

// MARK: - Concrete Factories

enum StudentAuthFactory: AuthFactory {
    static func makeView(for type: AuthType) -> View {
        switch type {
            case .login: return StudentLoginView()
            case .signUp: return StudentSignUpView()
        }
    }

    static func makeViewController(for type: AuthType) -> ViewController {
        let view = makeView(for: type)
        return StudentViewController(view: view)
    }
}

struct TeacherAuthFactory: AuthFactory {
    static func makeView(for type: AuthType) -> View {
        switch type {
            case .login: return TeacherLoginView()
            case .signUp: return TeacherSignUpView()
        }
    }

    static func makeViewController(for type: AuthType) -> ViewController {
        let view = makeView(for: type)
        return TeacherViewController(view: view)
    }
}

// MARK: - Client

struct AuthPresenter {
    private let factory: AuthFactory.Type

    init(factory: AuthFactory.Type) {
        self.factory = factory
    }

    func present(type: AuthType) {
        let controller = factory.makeViewController(for: type)
        print("🚀 Presenting: \(controller)")
    }
}

// MARK: - Example

print("=== Student Mode ===")
let studentPresenter = AuthPresenter(factory: StudentAuthFactory.self)
studentPresenter.present(type: .login)
studentPresenter.present(type: .signUp)

print("\n=== Teacher Mode ===")
let teacherPresenter = AuthPresenter(factory: TeacherAuthFactory.self)
teacherPresenter.present(type: .login)
teacherPresenter.present(type: .signUp)
