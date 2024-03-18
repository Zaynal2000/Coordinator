//
//  CommunitiesFactory.swift
//  SprintCoordinator
//
//  Created by Зайнал Гереев on 21.12.2023.
//

import UIKit

protocol CommunitiesFactory{
    func makeCommunitiesViewController() -> UIViewController
    func makeItemTabBar(navigation: Navigation)
}

struct CommunitiesFactoryImp: CommunitiesFactory {
    
    func makeCommunitiesViewController() -> UIViewController{
        let controller = CommunitiesViewController()
        controller.navigationItem.title = "Communities"
        return controller
    }
    
    func makeItemTabBar(navigation: Navigation) {
        makeItemTabBar(navigation: navigation,
                       title: "Communities",
                       image: "person.3",
                       selectedImage: "person.3.fill")
    }
    
}

extension CommunitiesFactoryImp: ItemTabBarFactory { }
