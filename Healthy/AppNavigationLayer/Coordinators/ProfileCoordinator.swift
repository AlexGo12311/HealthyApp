//
//  ProfileCoordinator.swift
//  Healthy
//
//  Created by Alex Neumark on 23.07.2024.
//

import UIKit

class ProfileCoordinator: Coordinator {
    override func start() {
        let vc = ViewController()
        vc.view.backgroundColor = .magenta
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func finish() {
        print("Application was stopped")
    }
}
