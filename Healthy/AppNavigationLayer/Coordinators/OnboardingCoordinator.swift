//
//  OnboardingCoordinator.swift
//  Healthy
//
//  Created by Alex Neumark on 23.07.2024.
//

import UIKit

class OnboardingCoordinator: Coordinator {
    private let userStorage = UserStorage.shared
    private let factory = OnboardingFlowFactory.self
    
    override func start() {
        showOnboarding()
    }
    
    override func finish() {
        finishDelegate?.coordinatorDidFinish(childCoordinator: self)
        print("onboarding was stopped")
    }
}

extension OnboardingCoordinator {
    func showOnboarding() {
        let presenter = OnboardingViewPresenter(coordinator: self)
        let vc = factory.make(presenter: presenter)
        navigationController?.pushViewController(vc, animated: true)
    }
}

