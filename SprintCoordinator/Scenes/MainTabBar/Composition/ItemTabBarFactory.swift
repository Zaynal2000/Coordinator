//
//  ItemTabBarFactory.swift
//  SprintCoordinator
//
//  Created by Зайнал Гереев on 06.12.2023.
//

import UIKit

protocol ItemTabBarFactory {
    
}

extension ItemTabBarFactory {
    
    func makeItemTabBar(navigation: Navigation, title: String, image: String, selectedImage: String) {
        let tabBarItem = UITabBarItem(title: title,
                                      image: UIImage(systemName: image),
                                      selectedImage: UIImage(systemName: selectedImage))
        navigation.rootViewController.tabBarItem = tabBarItem
    }
                                      
}
