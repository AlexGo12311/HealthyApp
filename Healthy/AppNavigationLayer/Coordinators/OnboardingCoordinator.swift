//
//  OnboardingCoordinator.swift
//  Healthy
//
//  Created by Alex Neumark on 23.07.2024.
//

import UIKit

class OnboardingCoordinator: Coordinator {
    override func start() {
        showOnboarding()
    }
    
    override func finish() {
        print("Application was stopped")
    }
}

extension OnboardingCoordinator {
    func showOnboarding() {
        var pages = [UIViewController]()
        
        let firstVC = UIViewController()
        firstVC.view.backgroundColor = .black
        pages.append(firstVC)
        
        let secondVc = UIViewController()
        secondVc.view.backgroundColor = .gray
        pages.append(secondVc)
        
        let thirdVc = UIViewController()
        thirdVc.view.backgroundColor = .brown
        pages.append(thirdVc)
        
        let presenter = OnboardingViewPresenter(coordinator: self)
        let vc = OnboardingViewController(pages: pages, viewOutput: presenter)
        navigationController?.pushViewController(vc, animated: true)
    }
}

