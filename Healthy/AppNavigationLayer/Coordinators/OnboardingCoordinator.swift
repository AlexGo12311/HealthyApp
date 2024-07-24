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
        var pages = [OnboardingLayerController]()
        
        let firstVC = OnboardingLayerController(image: UIImage(resource: .lifesaversHand), titleText: "Discover Top Doctors", descriptionText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus lacinia libero ut metus convallis tempor. Vestibulum consequat, tortor mattis consequat", buttonText: "Next")
        firstVC.view.backgroundColor = .white
        pages.append(firstVC)
        
        let secondVc = OnboardingLayerController(image: UIImage(resource: .lifesaversCaretaking), titleText: "Ask a Doctor Online", descriptionText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus lacinia libero ut metus convallis tempor. Vestibulum consequat, tortor mattis consequat", buttonText: "Next")
        secondVc.view.backgroundColor = .white
        pages.append(secondVc)
        
        let thirdVc = OnboardingLayerController(image: UIImage(resource: .lifesaversNewPatient), titleText: "Get Expert Advice", descriptionText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus lacinia libero ut metus convallis tempor. Vestibulum consequat, tortor mattis consequat", buttonText: "Great!")
        thirdVc.view.backgroundColor = .white
        pages.append(thirdVc)
        
        let presenter = OnboardingViewPresenter(coordinator: self)
        let vc = OnboardingViewController(pages: pages, viewOutput: presenter)
        navigationController?.pushViewController(vc, animated: true)
    }
}

