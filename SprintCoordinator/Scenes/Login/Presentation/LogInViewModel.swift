//
//  LogInViewModel.swift
//  SprintCoordinator
//
//  Created by Зайнал Гереев on 28.11.2023.
//

import Foundation

final class LogInViewModel {
    
    var logInAuth: LogInAuth?
    
    init(logInAuth: LogInAuth?) {
        self.logInAuth = logInAuth
    }
    
    func logIn() {
        logInAuth?.logIn()
    }
}
