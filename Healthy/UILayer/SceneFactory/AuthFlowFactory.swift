//
//  AuthFlowFactory.swift
//  Healthy
//
//  Created by Alex Neumark on 02.08.2024.
//

import Foundation

struct AuthFlowFactory {
    static func makeInitialScene(coordinator: AppCoordinator) -> AuthViewController {
        let presenter = AuthPresenter(coordinator: coordinator)
        let controller = AuthViewController(output: presenter, state: .initial)
        return controller
    }
    
    static func makeLoginScene(coordinator: AppCoordinator) -> AuthViewController {
        let presenter = AuthPresenter(coordinator: coordinator)
        let controller = AuthViewController(output: presenter, state: .login)
        return controller
    }
    
    static func makeSignUpScene(coordinator: AppCoordinator) -> AuthViewController {
        let presenter = AuthPresenter(coordinator: coordinator)
        let controller = AuthViewController(output: presenter, state: .signUp)
        return controller
    }
}
