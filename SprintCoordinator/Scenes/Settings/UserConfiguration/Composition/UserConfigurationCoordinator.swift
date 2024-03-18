//
//  UserConfigurationCoordinator.swift
//  SprintCoordinator
//
//  Created by Зайнал Гереев on 22.01.2024.
//

import UIKit

protocol UserConfigurationCoordinatorDelegate: AnyObject {
    func didFinish(childCoordinator: Coordinator)
}

final class UserConfigurationCoordinator: Coordinator {
    var navigation: Navigation
    private let factory: UserConfigurationFactory
    private weak var delegate: UserConfigurationCoordinatorDelegate?
    
    init(navigation: Navigation, factory: UserConfigurationFactory, delegate: UserConfigurationCoordinatorDelegate?) {
        self.navigation = navigation
        self.factory = factory
        self.delegate = delegate
    }
    
    func start() {
        let controller = factory.makeUserConfigurationViewController(coordinator: self)
        navigation.viewControllers = [controller]
    }
    
    
}

extension UserConfigurationCoordinator: UserConfigurationViewControllerCoordinator {
    
    func didSelectAvatarButton() {
        navigation.pushViewController(factory.makeAvatarViewController(), animated: true)
    }
    
    func didFinishFlow() {
        delegate?.didFinish(childCoordinator: self)
    }
    
}


