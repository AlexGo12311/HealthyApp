//
//  OnboardingViewPresenter.swift
//  Healthy
//
//  Created by Alex Neumark on 23.07.2024.
//

import UIKit

protocol OnboardingOutput: AnyObject {
    func onboardingFinish()
}

class OnboardingViewPresenter: OnboardingOutput {
    private let userStorage = UserStorage.shared
    weak var coordinator: OnboardingCoordinator!
    
    init(coordinator: OnboardingCoordinator!) {
        self.coordinator = coordinator
    }
    
    func onboardingFinish() {
        userStorage.isOnboarding = true
        print("Now onboarding 'll never launch")
        coordinator.finish()
    }
}
