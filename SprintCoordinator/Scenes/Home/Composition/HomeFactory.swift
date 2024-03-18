//
//  HomeFactory.swift
//  SprintCoordinator
//
//  Created by Зайнал Гереев on 11.01.2024.
//

import UIKit

protocol HomeFactory {
    func makeHomeViewController(coordinator: HomeViewControllerCoordinator) -> UIViewController
    func makeItemTabBar(navigation: Navigation)
    func makePostDetailsCoordinator(navigation: Navigation, id: Int, parentCoordinator: ParentCoordinator?) -> Coordinator
}

struct HomeFactoryImp: HomeFactory{
    
    func makeHomeViewController(coordinator: HomeViewControllerCoordinator) -> UIViewController {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width,
                                 height: UIScreen.main.bounds.width / 3)
        let controller = HomeViewController(collectionViewLayout: layout, coordinator: coordinator)
        controller.navigationItem.title = "Home"
        return controller
    }
    
    func makeItemTabBar(navigation: Navigation) {
        makeItemTabBar(navigation: navigation,
                       title: "Home",
                       image: "house",
                       selectedImage: "house.fill")
    }

    func makePostDetailsCoordinator(navigation: Navigation, id: Int, parentCoordinator: ParentCoordinator?) -> Coordinator {
        let factory = PostDetailsFactory(id: id)
        let coorditaor = PostDetailsCoordinator(navigation: navigation, factory: factory, parentCoordinator: parentCoordinator)
        return coorditaor
    }
    
}

extension HomeFactoryImp: ItemTabBarFactory{
    
}
