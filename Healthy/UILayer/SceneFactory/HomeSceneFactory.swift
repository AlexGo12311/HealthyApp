//
//  HomeSceneFactory.swift
//  Healthy
//
//  Created by Alex Neumark on 05.08.2024.
//

import UIKit

struct HomeSceneFactory {
    static func makeHomeScene(coordinator: HomeCoordinator) -> HomeViewController {
        // TODO: Add presenter
        let controller = HomeViewController()
        return controller
    }
}
