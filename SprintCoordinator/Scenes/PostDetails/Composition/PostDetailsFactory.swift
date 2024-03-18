//
//  PostDetailsFactory.swift
//  SprintCoordinator
//
//  Created by Зайнал Гереев on 14.01.2024.
//

import UIKit

struct PostDetailsFactory {
    
    private(set) var id: Int
    
    func makePostDetailViewController(coordinator: PostDetailsControllerCoordinator) -> UIViewController {
        let controller = PostDetailsViewController(coordinator: coordinator)
        controller.title = "Post #\(id)"
        return controller
    }
    
    func makePhotosViewController() -> UIViewController{
        makeExampleViewController(title: "Photos")
    }
    
    func makeMoreDetailsViewController() -> UIViewController{
        makeExampleViewController(title: "More Details")
    }
    
    func makeSourceViewController() -> UIViewController{
        makeExampleViewController(title: "Source")
    }
    
    private func makeExampleViewController(title: String) -> UIViewController {
        let controller = ExampleViewController()
        controller.title = title
        let navigation = UINavigationController(rootViewController: controller)
        return navigation
    }
}
