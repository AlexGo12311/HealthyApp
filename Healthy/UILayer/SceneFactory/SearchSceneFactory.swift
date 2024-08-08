//
//  HomeSceneFactory.swift
//  Healthy
//
//  Created by Alex Neumark on 05.08.2024.
//

import UIKit

struct SearchSceneFactory {
    static func makeSearchScene(coordinator: SearchCoordinator) -> SearchViewController {
        // TODO: Add presenter
        let controller = SearchViewController()
        return controller
    }
}
