//
//  Auth.swift
//  SprintCoordinator
//
//  Created by Зайнал Гереев on 28.11.2023.
//

import Foundation

protocol SessionCheckerAuth {
    var isSessionActive: Bool { get }
}

protocol LogInAuth {
    func logIn()
}

protocol LogOutAuth {
    func logOut()
}




final class Auth {
    
    private var session = false
}

//MARK: - SessionCheckerAuth

extension Auth: SessionCheckerAuth {
    var isSessionActive: Bool{
        session
    }
}

//MARK: - LogInAuth
extension Auth: LogInAuth{
        func logIn() {
            session = true
        }
    }
    
//MARK: - LogOutAuth
extension Auth: LogOutAuth{
    
    func logOut() {
        session = false
    }
}
