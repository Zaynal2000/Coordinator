//
//  MainTabBarCoordinator.swift
//  SprintCoordinator
//
//  Created by Зайнал Гереев on 29.11.2023.
//

import UIKit

protocol MainTabBarCoordinatorDelegate: AnyObject {
    func didFinish()
}

final class MainTabBarCoordinator: Coordinator {
    
    var navigation: Navigation
    private let factory: MainTabBarFactory
    private weak var delegate: MainTabBarCoordinatorDelegate?
    var childsCoordinators: [Coordinator] = []
    
    init(navigation: Navigation, factory: MainTabBarFactory, delegate: MainTabBarCoordinatorDelegate?) {
        self.navigation = navigation
        self.factory = factory
        self.delegate = delegate
    }
    
    func start() {
        let navigationTabBar = factory.makeTabBarController()
        navigation.pushViewController(navigationTabBar, animated: false)
        navigation.navigationBar.isHidden = true
        
        childsCoordinators = factory.makeChildCoordinators(delegate: self)
        let childNavigation = childsCoordinators.map { $0.navigation.rootViewController }
        childsCoordinators.forEach { $0.start() }
        navigationTabBar.viewControllers = childNavigation
    }
    
    
}

extension MainTabBarCoordinator: SettingsCoordinatorDelegate {
    func didTapLogOut() {
        childsCoordinators = []
        delegate?.didFinish()
    }
}
