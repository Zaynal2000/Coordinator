//
//  UserConfigurationViewController.swift
//  SprintCoordinator
//
//  Created by Зайнал Гереев on 22.01.2024.
//

import UIKit

protocol UserConfigurationViewControllerCoordinator: AnyObject {
    func didSelectAvatarButton()
    func didFinishFlow()
}

final class UserConfigurationViewController: UIViewController {
    
    private weak var coordinator: UserConfigurationViewControllerCoordinator?
    
    init(coordinator: UserConfigurationViewControllerCoordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        let avatarButton = UIBarButtonItem(image: UIImage(systemName: "person"), primaryAction: avatarAction())
        navigationItem.rightBarButtonItem = avatarButton
        
        let closeButton = UIBarButtonItem(systemItem: .close, primaryAction: closeFlowButton())
        navigationItem.leftBarButtonItem = closeButton
    }
    
    private func avatarAction() -> UIAction{
        UIAction { [ weak self ] _ in
            self?.coordinator?.didSelectAvatarButton()
        }
    }
    
    private func closeFlowButton() -> UIAction{
        UIAction { [ weak self ] _ in
            self?.coordinator?.didFinishFlow()
        }
    }
    
}
