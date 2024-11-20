//
//  TaskListRouter.swift
//  ToDoTest
//
//  Created by Паша Настусевич on 19.11.24.
//

import UIKit

protocol TaskListRouterInputProtocol {
    init(view: TaskListViewController)
    
}

final class TaskListRouter: TaskListRouterInputProtocol {
    private unowned let view: TaskListViewController
    
    required init(view: TaskListViewController) {
        self.view = view
    }
}

