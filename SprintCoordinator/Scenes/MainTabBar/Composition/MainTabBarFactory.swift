//
//  MainTabBarFactory.swift
//  SprintCoordinator
//
//  Created by Зайнал Гереев on 29.11.2023.
//

import UIKit

struct MainTabBarFactory {
    let appDIContainer: AppDIContainer?
    
    
    func makeTabBarController() -> MainTabBarController {
        let mainTabBarController = MainTabBarController()
        mainTabBarController.viewControllers = [UIViewController()]
        mainTabBarController.title = "Main"
        
        return mainTabBarController
    }
    
    func makeChildCoordinators(delegate: SettingsCoordinatorDelegate) -> [Coordinator] {
        let settingsCoordinator = makeSettingsCoordinator(delegate: delegate)
        let communitiesCoordinator = makeCommunitiesCoordinator()
        let myPostCoordinator = makeMyPostCoordinator()
        let makeHomeCoordinator = makeHomeCoordinator()
        return [makeHomeCoordinator, myPostCoordinator, communitiesCoordinator, settingsCoordinator]
    }
    
    private func makeSettingsCoordinator(delegate: SettingsCoordinatorDelegate) -> Coordinator {
        let factory  = SettingsFactory(appDIContainer: appDIContainer)
        let navigation = NavigationImp(rootViewController: UINavigationController()) // появляется своя навигация
        return SettingsCoordinator(navigation: navigation, factory: factory, delegate: delegate)
    }
    
    private func makeCommunitiesCoordinator() -> Coordinator {
        let factory  = CommunitiesFactoryImp()
        let navigation = NavigationImp(rootViewController: UINavigationController())
        return CommunitiesCoordinator(navigation: navigation, factory: factory)
    }
    
    private func makeMyPostCoordinator() -> Coordinator {
        let factory  = MyPostFactoryImp()
        let mediator = MyPostMediatorImp()
        let navigation = NavigationImp(rootViewController: UINavigationController())
        return MyPostCoordinator(navigation: navigation, factory: factory, mediator: mediator)
        
    }
    
    private func makeHomeCoordinator() -> Coordinator {
        let factory  = HomeFactoryImp()
        let navigation = NavigationImp(rootViewController: UINavigationController())
        return HomeCoordinator(navigation: navigation, factory: factory)
        
    }
    
}
