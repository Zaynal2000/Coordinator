//
//  SettingsViewModel.swift
//  SprintCoordinator
//
//  Created by Зайнал Гереев on 05.12.2023.
//

import Foundation

final class SettingsViewModel {
    
    private var itemsSettingsViewModel: [ItemSettingsViewModel] = [
        ItemSettingsViewModel(title: "User Configuration", icon: "person", isNavigable: false, navigation: .userConfiguration),
        ItemSettingsViewModel(title: "Account", icon: "archivebox.circle", isNavigable: true, navigation: .account),
        ItemSettingsViewModel(title: "Theme", icon: "paintbrush", isNavigable: true, navigation: .theme),
        ItemSettingsViewModel(title: "LogOut", icon: "door.right.hand.open", isNavigable: true, navigation: .logOut),
        ItemSettingsViewModel(title: "Version App 1.0.1", icon: "apps.iphone", isNavigable: false, navigation: .noNavigation)
    ]
    private var auth: LogOutAuth?
    
    var settingsCount: Int {
        itemsSettingsViewModel.count
    }
    
    init(auth: LogOutAuth?) {
        self.auth = auth
    }
    
    
    private func logOut() {
        auth?.logOut()
    }
    
    func getItemSettingsViewModel(row: Int) -> ItemSettingsViewModel {
        itemsSettingsViewModel[row]
    }
    
    func cellSelected(row: Int) -> SettingsViewNavigation {
        let navigation = itemsSettingsViewModel[row].navigation
        if navigation == .logOut {
            logOut()
        }
        return navigation
    }
    
}
