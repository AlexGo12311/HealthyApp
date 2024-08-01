//
//  AppCoordinator.swift
//  Healthy
//
//  Created by Alex Neumark on 23.07.2024.
//

import UIKit

class AppCoordinator: Coordinator {
    
    private let userStrage = UserStorage.shared
    private let factory = MainFlowFactory.self
    
    override func start() {
        let authPresetor = AuthPresenter(coordinator: self)
        let AuthVc = AuthViewController(output: authPresetor, state: .login)
        navigationController?.pushViewController(AuthVc, animated: true)
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
        let tabBarController = factory.make(superCoordinator: self, finishDelegate: self)
        navigationController.pushViewController(tabBarController, animated: true)
    }
}

extension AppCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: CoordinatorProtocol) {
        removeChildCoordinator(childCoordinator)
        switch childCoordinator.type {
        case .app:
            return
        case .onboarding:
            navigationController?.viewControllers.removeAll()
            showMainFlow()
        default:
            navigationController?.popToRootViewController(animated: false)
        }
    }
}
