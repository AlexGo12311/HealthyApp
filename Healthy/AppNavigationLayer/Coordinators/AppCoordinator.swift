//
//  AppCoordinator.swift
//  Healthy
//
//  Created by Alex Neumark on 23.07.2024.
//

import UIKit

class AppCoordinator: Coordinator {
    
    private let userStrage = UserStorage.shared
    
    override func start() {
        if userStrage.isOnboarding {
            showMainFlow()
        } else {
            showOnboardingFlow()
        }
    }
    
    override func finish() {
        print("Application was stopped")
    }
}

// MARK: - Navigation
private extension AppCoordinator {
    func showOnboardingFlow() {
        guard let navigationController = navigationController else { return }
        let onboardingCoordonator = OnboardingCoordinator(type: .onboarding, navigationController: navigationController, finishDelegate: self)
        addChildCoordinator(onboardingCoordonator)
        onboardingCoordonator.start()
    }
    
    func showMainFlow() {
        guard let navigationController = navigationController else { return }
        
        let homeNavigationController = UINavigationController()
        homeNavigationController.tabBarItem = UITabBarItem(title: "Home", image: UIImage.init(systemName: "house"), tag: 0)
        let homeCoordinator = HomeCoordinator(type: .home, navigationController: homeNavigationController)
        homeCoordinator.finishDelegate = self
        addChildCoordinator(homeCoordinator)
        homeCoordinator.start()
        
        let searchNavigationController = UINavigationController()
        searchNavigationController.tabBarItem = UITabBarItem(title: "Search", image: UIImage.init(systemName: "magnifyingglass"), tag: 1)
        let searchCoordinator = SearchCoordinator(type: .search, navigationController: searchNavigationController)
        searchCoordinator.finishDelegate = self
        addChildCoordinator(searchCoordinator)
        searchCoordinator.start()
        
        let appointmentNavigationController = UINavigationController()
        appointmentNavigationController.tabBarItem = UITabBarItem(title: "Appointment", image: UIImage.init(systemName: "list.clipboard"), tag: 2)
        let appointmentCoordinator = AppointmentCoordinator(type: .appointment, navigationController: appointmentNavigationController)
        appointmentCoordinator.finishDelegate = self
        addChildCoordinator(appointmentCoordinator)
        appointmentCoordinator.start()
        
        let profileNavigationController = UINavigationController()
        profileNavigationController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage.init(systemName: "person.crop.circle"), tag: 3)
        let profileCoordinator = ProfileCoordinator(type: .profile, navigationController: profileNavigationController)
        profileCoordinator.finishDelegate = self
        addChildCoordinator(profileCoordinator)
        profileCoordinator.start()
        
        let coontrollers = [homeNavigationController, searchNavigationController, appointmentNavigationController, profileNavigationController]
        let tabBarController = TabBarController(controllers: coontrollers)
        
        navigationController.pushViewController(tabBarController, animated: true)
    }
}

extension AppCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: CoordinatorProtocol) {
        removeChildCoordinator(childCoordinator)
        switch childCoordinator.type {
        case .app:
            return
        case .onboarding:
            navigationController?.viewControllers.removeAll()
            showMainFlow()
        default:
            navigationController?.popToRootViewController(animated: false)
        }
    }
}
