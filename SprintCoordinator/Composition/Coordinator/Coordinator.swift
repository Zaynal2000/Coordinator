//
//  Coordinator.swift
//  SprintCoordinator
//
//  Created by Зайнал Гереев on 28.11.2023.
//

import UIKit

protocol Coordinator: AnyObject {
    var navigation: Navigation { get set }
    func start()
}
