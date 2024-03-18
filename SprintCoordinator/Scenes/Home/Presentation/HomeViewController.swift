//
//  HomeViewController.swift
//  SprintCoordinator
//
//  Created by Зайнал Гереев on 10.01.2024.
//

import UIKit

protocol HomeViewControllerCoordinator: AnyObject {
    func didSelectPost(id: Int)
}

final class HomeViewController: UICollectionViewController {
    
    private weak var coordinator: HomeViewControllerCoordinator?

    init(collectionViewLayout: UICollectionViewLayout, coordinator: HomeViewControllerCoordinator) {
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
    }
    
    
    private func configCollectionView() {
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "id")
        collectionView.backgroundColor = .systemGroupedBackground
    }
}

extension HomeViewController{
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
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

