//
//  CommunitiesCoordinator.swift
//  SprintCoordinator
//
//  Created by Зайнал Гереев on 21.12.2023.
//

import UIKit

final class CommunitiesCoordinator: Coordinator {
    var navigation: Navigation
    private let factory: CommunitiesFactory
    
    init(navigation: Navigation, factory: CommunitiesFactory) {
        self.navigation = navigation
        self.factory = factory
    }
    
    func start() {
        let controller = factory.makeCommunitiesViewController()
        factory.makeItemTabBar(navigation: navigation)
        navigation.navigationBar.prefersLargeTitles = true
        navigation.pushViewController(controller, animated: true)
    }
    
    
    
    
}
