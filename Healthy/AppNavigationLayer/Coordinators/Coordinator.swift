//
//  Coordinator.swift
//  Healthy
//
//  Created by Alex Neumark on 23.07.2024.
//

import UIKit

enum CoordinatorTypes {
    case app
    case onboarding
    case home
    case search
    case appointment
    case profile
}

protocol CoordinatorProtocol: AnyObject {
    var type: CoordinatorTypes { get }
    
    func start()
    
    var navigationController: UINavigationController? { get set }
    var childCoordinators: [CoordinatorProtocol] { get set }
    var finishDelegate: CoordinatorFinishDelegate? { get set }
    
    func finish()
}

extension CoordinatorProtocol {
    func addChild(_ childCoordinator: CoordinatorProtocol) {
        childCoordinators.append(childCoordinator)
    }
    func removeChild(_ childCoordinator: CoordinatorProtocol) {
        childCoordinators = childCoordinators.filter { $0 !== childCoordinator }
    }
}

protocol CoordinatorFinishDelegate: AnyObject {
    func coordinatorDidFinish(childCoordinator: CoordinatorProtocol)
}
