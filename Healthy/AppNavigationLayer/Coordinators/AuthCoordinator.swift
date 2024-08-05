//
//  AuthCoordinator.swift
//  Healthy
//
//  Created by Alex Neumark on 05.08.2024.
//

import UIKit

class AuthCoordinator: Coordinator {
    private let userStorage = UserStorage.shared
    private let factory = AuthFlowFactory.self
    
    override func start() {
        showAuthInitialScene()
    }
    
    override func finish() {
        finishDelegate?.coordinatorDidFinish(childCoordinator: self)
        print("Auth was stopped")
    }
}

// MARK: - Navigation
extension AuthCoordinator {
    func showAuthInitialScene() {
        guard let navigationController = navigationController else { return }
        let aVC = factory.makeInitialScene(coordinator: self)
        navigationController.pushViewController(aVC, animated: true)
    }
    
    func showAuthLoginScene() {
        guard let navigationController = navigationController else { return }
        let aVC = factory.makeLoginScene(coordinator: self)
        navigationController.pushViewController(aVC, animated: true)
    }
    
    func showAuthSignUpScene() {
        guard let navigationController = navigationController else { return }
        let aVC = factory.makeSignUpScene(coordinator: self)
        navigationController.pushViewController(aVC, animated: true)
    }
}


