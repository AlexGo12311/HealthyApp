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
        showMainFlow()
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
        let tabBarController = MainFactory.make(superCoordinator: self, finishDelegate: self)
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = .fade
        self.window?.layer.add(transition, forKey: kCATransition)
        self.window?.rootViewController = tabBarController
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
