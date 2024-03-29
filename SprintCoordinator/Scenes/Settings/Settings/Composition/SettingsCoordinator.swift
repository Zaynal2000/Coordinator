//
//  SettingsCoordinator.swift
//  SprintCoordinator
//
//  Created by Зайнал Гереев on 05.12.2023.
//

import UIKit

protocol SettingsCoordinatorDelegate: AnyObject {
    func didTapLogOut()
}

final class SettingsCoordinator: Coordinator {
    var navigation: Navigation
    var factory: SettingsFactory
    weak var delegate: SettingsCoordinatorDelegate?
    var childCoordinators: [Coordinator] = []
    
    init(navigation: Navigation, factory: SettingsFactory, delegate: SettingsCoordinatorDelegate) {
        self.navigation = navigation
        self.factory = factory
        self.delegate = delegate
    }
    
    func start() {
        let controller = factory.makeSettingsController(coordinator: self)
        navigation.navigationBar.prefersLargeTitles = true
        navigation.pushViewController(controller, animated: true)
        factory.makeItemTabBar(navigation: navigation)
    }
}

extension SettingsCoordinator: ParentCoordinator {
    
}
