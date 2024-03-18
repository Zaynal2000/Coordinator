//
//  ParentCoordinator.swift
//  SprintCoordinator
//
//  Created by Зайнал Гереев on 18.01.2024.
//

import Foundation

protocol ParentCoordinator: AnyObject{
    var childCoordinators: [Coordinator] { get set }
}

extension ParentCoordinator {
    
    func addChildCoordinatorStart(_ childCoordinator: Coordinator?) {
        guard let childCoordinator else { return }
        childCoordinators.append(childCoordinator)
        childCoordinator.start()
    }
    
    func removeChildCoordinator(_ childCoordinator: Coordinator) {
        childCoordinators = childCoordinators.filter{ $0 !== childCoordinator }
    }
    
    func clearAllChildCoordinators() {
        childCoordinators = []
    }
    
}
