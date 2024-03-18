//
//  PostDetailsViewController.swift
//  SprintCoordinator
//
//  Created by Зайнал Гереев on 14.01.2024.
//

import UIKit

protocol PostDetailsControllerCoordinator: AnyObject {
    func didTapPhotosButton()
    func didTapMoreDetailsButton()
    func didTapSourceButton()
}

final class PostDetailsViewController: UIViewController {
    
    private let photoButton: UIButton = {
        let button = UIButton(type: .system)
        var configuration = UIButton.Configuration.filled()
        configuration.title = "Photos"
        button.configuration = configuration
        return button
    }()
    
    private let moreDetailsButton: UIButton = {
        let button = UIButton(type: .system)
        var configuration = UIButton.Configuration.filled()
        configuration.title = "More Details"
        button.configuration = configuration
        return button
    }()
    
    private let sourceButton: UIButton = {
        let button = UIButton(type: .system)
        var configuration = UIButton.Configuration.filled()
        configuration.title = "Source"
        button.configuration = configuration
        return button
    }()
    
    private weak var coordinator: PostDetailsControllerCoordinator?
    
    init(coordinator: PostDetailsControllerCoordinator) {
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
        
        let stackView = UIStackView(arrangedSubviews: [photoButton, moreDetailsButton, sourceButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        view.addSubview(stackView)
        
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        configActions()
    }
    
    private func configActions() {
        
        let photosAction = UIAction { [ weak self ] _ in
            self?.coordinator?.didTapPhotosButton()
        }
        photoButton.addAction(photosAction, for: .touchUpInside)
        
        let moreDetailAction = UIAction { [ weak self ] _ in
            self?.coordinator?.didTapMoreDetailsButton()
        }
        moreDetailsButton.addAction(moreDetailAction, for: .touchUpInside)
        
        let sourceAction = UIAction { [ weak self ] _ in
            self?.coordinator?.didTapSourceButton()
        }
        sourceButton.addAction(sourceAction, for: .touchUpInside)
        
    }
    
    
    
}
