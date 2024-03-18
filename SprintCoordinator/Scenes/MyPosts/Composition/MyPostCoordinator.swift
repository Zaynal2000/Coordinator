//
//  MyPostCoordinator.swift
//  SprintCoordinator
//
//  Created by Зайнал Гереев on 22.12.2023.
//

import UIKit

final class MyPostCoordinator: Coordinator {
    
    var navigation: Navigation
    private let factory: MyPostFactory
    private let mediator: MyPostMediator
    var childCoordinators: [Coordinator] = []
    
    init(navigation: Navigation, factory: MyPostFactory, mediator: MyPostMediator) {
        self.navigation = navigation
        self.factory = factory
        self.mediator = mediator
    }
    
    func start() {
        let controller = factory.makeMyPostViewController(coordinator: self)
        factory.makeItemTabBar(navigation: navigation)
        navigation.navigationBar.prefersLargeTitles = true
        navigation.pushViewController(controller, animated: true)
    }
    
}

extension MyPostCoordinator: MyPostsViewControllerCoordinator {
    func didSelectPost(id: Int) {
        let postDetailCoordinator = factory.makePostDetailsCoordinator(navigation: navigation, id: id, parentCoordinator: self)
        addChildCoordinatorStart(postDetailCoordinator)
    }
    
    func didTapAddNewPostButton() {
        let controller = factory.makeNewPostViewController(coordinator: self)
        navigation.present(controller, animated: true)
    }
}

extension MyPostCoordinator: NewPostViewControllerCoordinator{
    func didSaveNewPost(title: String) {
        navigation.dismiss(animated: true)
        mediator.updateController(title: title, navigation: navigation)
    }
}

extension MyPostCoordinator: ParentCoordinator {
    
}
