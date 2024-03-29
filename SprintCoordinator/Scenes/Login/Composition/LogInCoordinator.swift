//
//  LogInCoordinator.swift
//  SprintCoordinator
//
//  Created by Зайнал Гереев on 28.11.2023.
//

import UIKit

protocol LogInCoordinatorDelegate: AnyObject {
    func didFinishLogin()
}

final class LogInCoordinator: Coordinator {
    var navigation: Navigation
    var factory: LogInFactory
    weak var delegate: LogInCoordinatorDelegate?
    
    init(navigation: Navigation, factory: LogInFactory, delegate: LogInCoordinatorDelegate) {
        self.navigation = navigation
        self.factory = factory
        self.delegate = delegate
    }
    
    func start() {
        let controller = factory.makeLogInViewController(coordinator: self)
        navigation.pushViewController(controller, animated: true)
    }
}

//MARK: - LogInViewControllerCoordinator

extension LogInCoordinator: LogInViewControllerCoordinator {
    func didFinish() {
        delegate?.didFinishLogin()
    }
    
    
}
