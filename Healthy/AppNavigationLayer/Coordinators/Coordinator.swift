//
//  Coordinator.swift
//  Healthy
//
//  Created by Alex Neumark on 23.07.2024.
//

import UIKit

enum CoordinatorTypes {
    case app
    case auth
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

protocol tabBarControllerProtocol: AnyObject, CoordinatorProtocol {
    var tabBarController: UITabBarController { get set }
}

extension CoordinatorProtocol {
    func addChildCoordinator(_ childCoordinator: CoordinatorProtocol) {
        childCoordinators.append(childCoordinator)
    }
    func removeChildCoordinator(_ childCoordinator: CoordinatorProtocol) {
        childCoordinators = childCoordinators.filter { $0 !== childCoordinator }
    }
}

protocol CoordinatorFinishDelegate: AnyObject {
    func coordinatorDidFinish(childCoordinator: CoordinatorProtocol)
}

class Coordinator: CoordinatorProtocol {
    var type: CoordinatorTypes
    
    func start() {
        print("start")
    }
    
    var navigationController: UINavigationController?
    var childCoordinators: [CoordinatorProtocol]
    weak var finishDelegate: CoordinatorFinishDelegate?
    
    func finish() {
        print("finish")
    }
    
    init(type: CoordinatorTypes, navigationController: UINavigationController, childCoordinators: [CoordinatorProtocol] = [CoordinatorProtocol](), finishDelegate: CoordinatorFinishDelegate? = nil) {
        self.type = type
        self.navigationController = navigationController
        self.childCoordinators = childCoordinators
        self.finishDelegate = finishDelegate
    }
    
    deinit {
        childCoordinators.forEach { $0.finishDelegate = nil }
        childCoordinators.removeAll()
        print("Coordinator \(self.type) removed")
    }
    
    
}

