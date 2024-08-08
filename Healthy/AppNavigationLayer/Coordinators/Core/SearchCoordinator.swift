//
//  SearchCoordinator.swift
//  Healthy
//
//  Created by Alex Neumark on 23.07.2024.
//

import UIKit

class SearchCoordinator: Coordinator {
        private var factory = SearchSceneFactory.self
        
        override func start() {
            showSearchScene()
        }
        
        override func finish() {
            print("Application was stopped")
        }
    }

    // MARK: - Navigation
    extension SearchCoordinator {
        func showSearchScene() {
            guard let navigationController = navigationController else { return }
            let aVC = factory.makeSearchScene(coordinator: self)
            navigationController.pushViewController(aVC, animated: true)
        }
    }
