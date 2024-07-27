//
//  OnboardingFlowFactory.swift
//  Healthy
//
//  Created by Alex Neumark on 26.07.2024.
//

import UIKit

struct OnboardingFlowFactory {
    static func make(presenter: OnboardingViewPresenter) -> UIViewController {
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
        
        let vc = OnboardingViewController(pages: pages, viewOutput: presenter)
        return vc
    }
}
