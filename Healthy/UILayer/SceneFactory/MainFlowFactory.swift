//
//  MainFlowFactory.swift
//  Healthy
//
//  Created by Alex Neumark on 26.07.2024.
//

import UIKit

struct MainFlowFactory {
    static func make(superCoordinator: CoordinatorProtocol, finishDelegate: CoordinatorFinishDelegate) -> TabBarController {
        let homeNavigationController = UINavigationController()
        homeNavigationController.tabBarItem = UITabBarItem(title: "Home", image: UIImage.init(systemName: "house"), tag: 0)
        let homeCoordinator = HomeCoordinator(type: .home, navigationController: homeNavigationController)
        homeCoordinator.finishDelegate = finishDelegate
        superCoordinator.addChildCoordinator(homeCoordinator)
        homeCoordinator.start()
        
        let searchNavigationController = UINavigationController()
        searchNavigationController.tabBarItem = UITabBarItem(title: "Search", image: UIImage.init(systemName: "magnifyingglass"), tag: 1)
        let searchCoordinator = SearchCoordinator(type: .search, navigationController: searchNavigationController)
        searchCoordinator.finishDelegate = finishDelegate
        superCoordinator.addChildCoordinator(searchCoordinator)
        searchCoordinator.start()
        
        let appointmentNavigationController = UINavigationController()
        appointmentNavigationController.tabBarItem = UITabBarItem(title: "Appointment", image: UIImage.init(systemName: "list.clipboard"), tag: 2)
        let appointmentCoordinator = AppointmentCoordinator(type: .appointment, navigationController: appointmentNavigationController)
        appointmentCoordinator.finishDelegate = finishDelegate
        superCoordinator.addChildCoordinator(appointmentCoordinator)
        appointmentCoordinator.start()
        
        let profileNavigationController = UINavigationController()
        profileNavigationController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage.init(systemName: "person.crop.circle"), tag: 3)
        let profileCoordinator = ProfileCoordinator(type: .profile, navigationController: profileNavigationController)
        profileCoordinator.finishDelegate = finishDelegate
        superCoordinator.addChildCoordinator(profileCoordinator)
        profileCoordinator.start()
        
        let coontrollers = [homeNavigationController, searchNavigationController, appointmentNavigationController, profileNavigationController]
        let tabBarController = TabBarController(controllers: coontrollers)
        return tabBarController
    }
}
