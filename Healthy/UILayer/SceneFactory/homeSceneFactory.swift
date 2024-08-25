//
//  homeSceneFactory.swift
//  Healthy
//
//  Created by Alex Neumark on 22.08.2024.
//

import Foundation

struct HomeSceneFactory {
    static func makeHomeScene(coordinator: HomeCoordinator) -> HomeViewController {
        let controller = HomeViewController()
        return controller
    }
}
