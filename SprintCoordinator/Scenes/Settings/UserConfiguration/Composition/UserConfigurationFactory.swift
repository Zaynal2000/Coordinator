//
//  UserConfigurationFactory.swift
//  SprintCoordinator
//
//  Created by Зайнал Гереев on 22.01.2024.
//

import UIKit

struct UserConfigurationFactory {
    
    
    func makeUserConfigurationViewController(coordinator: UserConfigurationViewControllerCoordinator) -> UIViewController {
        let userConfigurationViewController = UserConfigurationViewController(coordinator: coordinator)
        userConfigurationViewController.title = "User Configuration"
        return userConfigurationViewController
    }
    
    func makeAvatarViewController() -> UIViewController {
        let exampleViewController = ExampleViewController()
        exampleViewController.title = "Make your avatar"
        return exampleViewController
    }
    
}
