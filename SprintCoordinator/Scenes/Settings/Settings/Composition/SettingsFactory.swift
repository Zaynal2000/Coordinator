//
//  SettingsFactory.swift
//  SprintCoordinator
//
//  Created by Зайнал Гереев on 05.12.2023.
//

import UIKit

struct SettingsFactory: ItemTabBarFactory {
    let appDIContainer: AppDIContainer?
    
    func makeSettingsController(coordinator: SettingsViewControllerCoordinator) -> UIViewController {
        let viewModel = SettingsViewModel(auth: appDIContainer?.auth)
        let controller = SettingsViewController(viewModel: viewModel, coordinator: coordinator)
        controller.title = "Settings"
        return controller
    }
    
    func makeItemTabBar(navigation: Navigation) {
        makeItemTabBar(navigation: navigation,
                       title: "Settings",
                       image: "gearshape.2",
                       selectedImage: "gearshape.2.fill")
    }
    
    func makeAccountViewController() -> UIViewController {
        let controller = ExampleViewController()
        controller.title = "Account"
        return controller
    }
    
    func makeThemeViewController() -> UIViewController {
        let controller = ExampleViewController()
        controller.title = "Theme"
        return controller
    }
    
    func makeUserConfigurationCoordinator(delegate: UserConfigurationCoordinatorDelegate)-> Coordinator {
        let factory = UserConfigurationFactory()
        let navigationController = UINavigationController()
        navigationController.modalPresentationStyle = .fullScreen
        let navigation = NavigationImp(rootViewController: navigationController)
        return UserConfigurationCoordinator(navigation: navigation, factory: factory, delegate: delegate)
    }
    
}
