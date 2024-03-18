//
//  LogInViewController.swift
//  SprintCoordinator
//
//  Created by Зайнал Гереев on 28.11.2023.
//

import UIKit

protocol LogInViewControllerCoordinator: AnyObject {
    func didFinish ()
}

final class LogInViewController: UIViewController {
    
    private weak var coordinator: LogInViewControllerCoordinator?
    private let viewModel: LogInViewModel
    
    private let logInButton: UIButton = {
        let button = UIButton(type: .system)
        var configuration = UIButton.Configuration.filled()
        configuration.title = "LogIn"
        button.configuration = configuration
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    init(coordinator: LogInViewControllerCoordinator?,
         viewModel: LogInViewModel) {
        self.coordinator = coordinator
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        configAction()
    }
    
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(logInButton)
        
        logInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logInButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
    }
    
    private func configAction() {
        let loginAction = UIAction { [ weak self ] _ in
            self?.viewModel.logIn()
            self?.coordinator?.didFinish()
        }
        logInButton.addAction(loginAction, for: .touchUpInside)
    }
}
