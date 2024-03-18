//
//  AppCoordinator.swift
//  SprintCoordinator
//
//  Created by Зайнал Гереев on 28.11.2023.
//

import UIKit

class AppCoordinator: Coordinator {
    
    var navigation: Navigation
    var window: UIWindow?
    var factory: AppFactory?
    var auth: SessionCheckerAuth?
    var childCoordinators: [Coordinator] = []
    
    init(navigation: Navigation, window: UIWindow?, factory: AppFactory?, auth: Auth?) {
        self.navigation = navigation
        self.window = window
        self.factory = factory
        self.auth = auth
    }
    
    func start() {
        configWindow()
        startSomeCoordinator()
    }
    
    private func configWindow() {
        window?.rootViewController = navigation.rootViewController
        window?.makeKeyAndVisible()
    }
    
    private func startSomeCoordinator() {
        guard let auth else { return }
        auth.isSessionActive ? startMainTabBarCoordinator() : startLogInCoordinator()
    }
    
    private func startLogInCoordinator() {
        let logInCoordinator = factory?.makeLogInCoordinator(navigation: navigation, delegate: self)
        addChildCoordinatorStart(logInCoordinator)
    }
    
    private func startMainTabBarCoordinator() {
        let mainTabBarCoordinator = factory?.makeTabBarCoordinator(navigation: navigation, delegate: self)
        addChildCoordinatorStart(mainTabBarCoordinator)
    }
    
    private func clearCoordinators() {
        navigation.viewControllers = []
        clearAllChildCoordinators()
        startSomeCoordinator()
    }
    
}

//MARK: - LogInCoordinatorDelegate

extension AppCoordinator: LogInCoordinatorDelegate {
    func didFinishLogin() {
        clearCoordinators()
    }
}

//MARK: - MainTabBarCoordinatorDelegate

extension AppCoordinator: MainTabBarCoordinatorDelegate {
    func didFinish() {
        clearCoordinators()
    }

}

extension AppCoordinator: ParentCoordinator{
    
}
