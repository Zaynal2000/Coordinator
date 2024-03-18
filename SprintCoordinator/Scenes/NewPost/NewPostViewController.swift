//
//  NewPostViewController.swift
//  SprintCoordinator
//
//  Created by Зайнал Гереев on 22.12.2023.
//

import UIKit

protocol NewPostViewControllerCoordinator: AnyObject{
    func didSaveNewPost(title: String)
}

final class NewPostViewController: UIViewController {
    
    private let savePostButton: UIButton = {
        let button = UIButton(type: .system)
        var configuration = UIButton.Configuration.filled()
        configuration.title = "Save"
        button.configuration = configuration
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private weak var coordinator: NewPostViewControllerCoordinator?
    
    init(coordinator: NewPostViewControllerCoordinator) {
        self.coordinator = coordinator
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
        
        
        view.addSubview(savePostButton)
        savePostButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        savePostButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    private func configAction() {
        let actionSave = UIAction { [weak self] _ in
            guard let self else { return }
            self.coordinator?.didSaveNewPost(title: self.randomPost())
        }
        savePostButton.addAction(actionSave, for: .touchUpInside)
    }
    
    private func randomPost() -> String {
        "Post #\(Int.random(in: 0...99))"
    }
    
}
