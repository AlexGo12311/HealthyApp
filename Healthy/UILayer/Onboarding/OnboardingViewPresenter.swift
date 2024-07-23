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
    weak var coordinator: OnboardingCoordinator!
    
    init(coordinator: OnboardingCoordinator!) {
        self.coordinator = coordinator
    }
    
    func onboardingFinish() {
        coordinator.finish()
    }
}
