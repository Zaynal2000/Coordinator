//
//  LoginFactory.swift
//  SprintCoordinator
//
//  Created by Зайнал Гереев on 28.11.2023.
//

import UIKit

struct LogInFactory {
    let appDIContainer: AppDIContainer?
    
    func makeLogInViewController(coordinator: LogInViewControllerCoordinator) -> UIViewController {
        LogInViewController(coordinator: coordinator,
                            viewModel: LogInViewModel(logInAuth: appDIContainer?.auth))
    }
}
