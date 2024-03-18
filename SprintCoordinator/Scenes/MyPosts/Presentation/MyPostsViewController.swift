//
//  MyPostsViewController.swift
//  SprintCoordinator
//
//  Created by Зайнал Гереев on 21.12.2023.
//

import UIKit

protocol MyPostsViewControllerCoordinator: AnyObject {
    func didSelectPost(id: Int)
    func didTapAddNewPostButton()
}

final class MyPostsViewController: UICollectionViewController {
    
    private weak var coordinator: MyPostsViewControllerCoordinator?
    
    private let exampleLabel = UILabel()
    
    private var counter = 0
    
    init(collectionViewLayout: UICollectionViewLayout, coordinator: MyPostsViewControllerCoordinator) {
        self.coordinator = coordinator
        super.init(collectionViewLayout: collectionViewLayout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configCollectionView()
    }
    
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        let newPostBarButtonItem = UIBarButtonItem(systemItem: .add, primaryAction: addNewPostAction())
        navigationItem.rightBarButtonItem = newPostBarButtonItem
        
        exampleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(exampleLabel)
        exampleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        exampleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    private func addNewPostAction() -> UIAction{
        UIAction{ [ weak self ] _ in
            self?.coordinator?.didTapAddNewPostButton()
        }
    }
    
    private func configCollectionView() {
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "id")
        collectionView.backgroundColor = .systemGroupedBackground
    }
    
    func updataLabel(text: String){
        exampleLabel.text = title
        counter += 1
        collectionView.reloadData()
    }
    
}


extension MyPostsViewController{
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        counter
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "id", for: indexPath)
        
        var contentConfiguretion = UIListContentConfiguration.cell()
        contentConfiguretion.text = "Hello"
        contentConfiguretion.secondaryText = "Secondary"
        contentConfiguretion.image = UIImage(systemName: "photo")
        cell.contentConfiguration = contentConfiguretion
        cell.backgroundColor = .systemBackground
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        coordinator?.didSelectPost(id: indexPath.row)
    }
    
    
}
