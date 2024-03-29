//
//  SettingsViewController.swift
//  SprintCoordinator
//
//  Created by Зайнал Гереев on 05.12.2023.
//

import UIKit

protocol SettingsViewControllerCoordinator: AnyObject {
    func didSelect(settingsViewNavigation: SettingsViewNavigation) 
}

final class SettingsViewController: UITableViewController {
    
    private let viewModel: SettingsViewModel
    private weak var coordinator: SettingsViewControllerCoordinator?
    
    init(viewModel: SettingsViewModel, coordinator: SettingsViewControllerCoordinator) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        super.init(style: .grouped)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configTableView()
    }
    
    private func configTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "id")
        tableView.backgroundColor = .systemGroupedBackground
    }
    
}

//MARK: - TableView Delegate

extension SettingsViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.settingsCount
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = viewModel.getItemSettingsViewModel(row: indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: "id", for: indexPath)
        
        var contentConfiguration = cell.defaultContentConfiguration()
        contentConfiguration.text = viewModel.title
        contentConfiguration.image = UIImage(systemName: viewModel.icon)
        cell.contentConfiguration = contentConfiguration
        if !viewModel.isNavigable{
            cell.selectionStyle = .none
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let navigation = viewModel.cellSelected(row: indexPath.row)
        coordinator?.didSelect(settingsViewNavigation: navigation)
    }
    
}
