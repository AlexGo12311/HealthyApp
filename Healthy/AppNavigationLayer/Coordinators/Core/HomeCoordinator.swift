//
//  HomeCoordinator.swift
//  Healthy
//
//  Created by Alex Neumark on 23.07.2024.
//

import UIKit

class HomeCoordinator: Coordinator {
    // MARK: - Properties
    private var factory = HomeSceneFactory.self
    
    override func start() {
        showHomeScene()
    }
    
    override func finish() {
        print("Application was stopped")
    }
}

// MARK: - Navigation
extension HomeCoordinator {
    func showHomeScene() {
        let vc = factory.makeHomeScene(coordinator: self)
        vc.view.backgroundColor = AccentColors.bgColor
        navigationController?.pushViewController(vc, animated: false)
    }
}
