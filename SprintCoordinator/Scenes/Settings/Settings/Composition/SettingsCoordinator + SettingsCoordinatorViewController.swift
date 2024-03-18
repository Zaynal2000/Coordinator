//
//  SettingsCoordinator + SettingsCoordinatorViewController.swift
//  SprintCoordinator
//
//  Created by Зайнал Гереев on 06.12.2023.
//

import Foundation

extension SettingsCoordinator: SettingsViewControllerCoordinator {
    func didSelect(settingsViewNavigation: SettingsViewNavigation) {
        switch settingsViewNavigation{
            
        case .userConfiguration:
            callUserConfigurationCoordinator()
        case .account:
            navigation.pushViewController(factory.makeAccountViewController(), animated: true)
        case .theme:
            navigation.pushViewController(factory.makeThemeViewController(), animated: true)
        case .logOut:
            delegate?.didTapLogOut()
        case .noNavigation:
            break
        }
    }
    
    private func callUserConfigurationCoordinator() {
        let userConfigurationCoordinator = factory.makeUserConfigurationCoordinator(delegate: self)
        addChildCoordinatorStart(userConfigurationCoordinator)
        navigation.present(userConfigurationCoordinator.navigation.rootViewController, animated: true)
        userConfigurationCoordinator.navigation.dismissNavigation = { [ weak self ] in
            self?.removeChildCoordinator(userConfigurationCoordinator)
        }
    }
    
}

extension SettingsCoordinator: UserConfigurationCoordinatorDelegate{
    func didFinish(childCoordinator: Coordinator) {
        childCoordinator.navigation.dismissNavigation = nil
        removeChildCoordinator(childCoordinator)
        navigation.dismiss(animated: true)
    }
    
    
}
