//
//  AppFactory.swift
//  SprintCoordinator
//
//  Created by Зайнал Гереев on 28.11.2023.
//

import UIKit

struct AppFactory {
    let appDIContainer: AppDIContainer?
    
    func makeLogInCoordinator(navigation: Navigation, delegate: LogInCoordinatorDelegate) -> Coordinator {
        let logInFactory = LogInFactory(appDIContainer: appDIContainer)
        return LogInCoordinator(navigation: navigation,
                                           factory: logInFactory,
                                           delegate: delegate)
    }
    
    func makeTabBarCoordinator(navigation: Navigation, delegate: MainTabBarCoordinatorDelegate) -> Coordinator {
        let factory = MainTabBarFactory(appDIContainer: appDIContainer)
        
        
        return MainTabBarCoordinator(navigation: navigation, factory: factory, delegate: delegate)
    }
    
}
