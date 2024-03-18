//
//  MyPostMediator.swift
//  SprintCoordinator
//
//  Created by Зайнал Гереев on 23.12.2023.
//

import UIKit

//когда мы сохраняем новый пост, то мы тайтл от нового поста должны передать на контроллер MyPost, мы можем в MyPostCoordinator-е получить экземпляр MyPostsViewController-а и воткнуть его туда, но так как у нас весь класс на абстракциях, а тут появится конкретный тип, нам этого не нужно, поэтому мы создали этого посредника

protocol MyPostMediator {
    func updateController(title: String, navigation: Navigation)
}

struct MyPostMediatorImp: MyPostMediator {
    func updateController(title: String, navigation: Navigation) {
        guard let myPostViewController = navigation.rootViewController.topViewController as? MyPostsViewController else { return }
        myPostViewController.updataLabel(text: title)
    }
}
