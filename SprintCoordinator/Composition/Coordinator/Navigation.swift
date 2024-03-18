//
//  Navigation.swift
//  SprintCoordinator
//
//  Created by Зайнал Гереев on 15.01.2024.
//

import UIKit

protocol Navigation{
    var rootViewController: UINavigationController { get }
    var viewControllers: [UIViewController] { get set }
    var navigationBar: UINavigationBar { get }
    func present (_ viewControllerToPresent: UIViewController, animated: Bool)
    func pushViewController(_ viewControllerToPresent: UIViewController,
                            animated: Bool,
                            backCompleteion: (() -> Void)?)
    func dismiss(animated: Bool)
    var dismissNavigation: (() -> Void)? { get set }
}

extension Navigation {
    func pushViewController(_ viewControllerToPresent: UIViewController, animated: Bool) {
        pushViewController(viewControllerToPresent, animated: animated, backCompleteion: nil)
    }
}

final class NavigationImp: NSObject {
    var rootViewController: UINavigationController
    var dismissNavigation: (() -> Void)?
    
    private var backCompletions: [UIViewController : () -> Void] = [ : ]  //создаем словарь со всеми backCompletions, потому что когда мы будем понимать у какого контроллера сработал backCompletions, мы сможем его обнулить
    
    init(rootViewController: UINavigationController) {
        self.rootViewController = rootViewController
        super.init()
        rootViewController.delegate = self
        rootViewController.presentationController?.delegate = self
    }
}

extension NavigationImp: Navigation {
    
    var viewControllers: [UIViewController] {
        get {
            rootViewController.viewControllers
        }
        set {
            rootViewController.viewControllers = newValue
        }
    }
    
    var navigationBar: UINavigationBar {
        rootViewController.navigationBar
    }
    
    func present(_ viewControllerToPresent: UIViewController, animated: Bool) {
        rootViewController.present(viewControllerToPresent, animated: animated)
    }
    
    func dismiss(animated: Bool) {
        rootViewController.dismiss(animated: animated)
    }
    
    func pushViewController(_ viewControllerToPresent: UIViewController, animated: Bool, backCompleteion: (() -> Void)?) {
        if let backCompleteion {
            backCompletions[viewControllerToPresent] = backCompleteion
        }
        
        rootViewController.pushViewController(viewControllerToPresent, animated: true)
    }
}

extension NavigationImp: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let controller = navigationController.transitionCoordinator?.viewController(forKey: .from),
              !navigationController.viewControllers.contains(controller) else { return }
        
        guard let completion = backCompletions[controller] else { return }
        completion()
        backCompletions.removeValue(forKey: controller)
    }  // этот метод отлавливает тот момент, когда мы нажимаем кнопку назад в навиготоре
}

extension NavigationImp: UIAdaptivePresentationControllerDelegate {
    
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        dismissNavigation?()
        dismissNavigation = nil
    }  // этот метод отлавливает момоент когда мы свапаем назад экран
}
