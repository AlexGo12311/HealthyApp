//
//  AppCoordinator.swift
//  Healthy
//
//  Created by Alex Neumark on 23.07.2024.
//

import UIKit

class AppCoordinator: Coordinator {
    
    private let userStrage = UserStorage.shared
    private let MainFactory = MainFlowFactory.self
    private let authFactory = AuthFlowFactory.self
    
    
    override func start() {
        showOnboardingFlow()
//        if userStrage.isOnboarding {
//            showMainFlow()
//        } else {
//            showOnboardingFlow()
//        }
    }
    
    override func finish() {
        print("Application was stopped")
    }
}

// MARK: - Navigation
private extension AppCoordinator {
    func showOnboardingFlow() {
        guard let navigationController = navigationController else { return }
        let onboardingCoordonator = OnboardingCoordinator(type: .onboarding, navigationController: navigationController, finishDelegate: self)
        addChildCoordinator(onboardingCoordonator)
        onboardingCoordonator.start()
    }
    
    func showMainFlow() {
        guard let navigationController = navigationController else { return }
        let tabBarController = MainFactory.make(superCoordinator: self, finishDelegate: self)
        navigationController.pushViewController(tabBarController, animated: true)
    }
    
    func showAuthFlow() {
        guard let navigationController = navigationController else { return }
        let authCoordonator = AuthCoordinator(type: .auth, navigationController: navigationController, finishDelegate: self)
        addChildCoordinator(authCoordonator)
        authCoordonator.start()
    }
}

extension AppCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: CoordinatorProtocol) {
        removeChildCoordinator(childCoordinator)
        switch childCoordinator.type {
        case .app:
            return
        case .auth:
            showMainFlow()
            navigationController?.viewControllers = [navigationController?.viewControllers.last ?? UIViewController()]
        case .onboarding:
            showAuthFlow()
            navigationController?.viewControllers = [navigationController?.viewControllers.last ?? UIViewController()]
        default:
            navigationController?.popToRootViewController(animated: false)
        }
    }
}
