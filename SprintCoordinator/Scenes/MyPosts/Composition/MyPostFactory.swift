//
//  MyPostFactory.swift
//  SprintCoordinator
//
//  Created by Зайнал Гереев on 22.12.2023.
//

import UIKit

protocol MyPostFactory{
    func makePostDetailsCoordinator(navigation: Navigation, id: Int, parentCoordinator: ParentCoordinator?) -> Coordinator
    func makeMyPostViewController(coordinator: MyPostsViewControllerCoordinator) -> UIViewController
    func makeNewPostViewController(coordinator: NewPostViewControllerCoordinator) -> UIViewController
    func makeItemTabBar(navigation: Navigation)
}

struct MyPostFactoryImp: ItemTabBarFactory, MyPostFactory {
    
    func makeMyPostViewController(coordinator: MyPostsViewControllerCoordinator) -> UIViewController {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width,
                                 height: UIScreen.main.bounds.width / 3)
        let controller = MyPostsViewController(collectionViewLayout: layout, coordinator: coordinator)
        controller.navigationItem.title = "My Post"
        return controller
    }
    
    func makeNewPostViewController(coordinator: NewPostViewControllerCoordinator) -> UIViewController {
        NewPostViewController(coordinator: coordinator)
    }
    
    func makeItemTabBar(navigation: Navigation) {
        makeItemTabBar(navigation: navigation,
                       title: "My Posts",
                       image: "list.bullet.rectangle.portrait",
                       selectedImage: "list.bullet.rectangle.portrait.fill")
    }
    
    func makePostDetailsCoordinator(navigation: Navigation, id: Int, parentCoordinator: ParentCoordinator?) -> Coordinator {
        let factory = PostDetailsFactory(id: id)
        let coorditaor = PostDetailsCoordinator(navigation: navigation, factory: factory, parentCoordinator: parentCoordinator)
        return coorditaor
    }
    
}
