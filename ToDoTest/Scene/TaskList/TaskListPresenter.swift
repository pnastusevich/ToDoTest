//
//  TaskListPresenter.swift
//  ToDoTest
//
//  Created by Паша Настусевич on 19.11.24.
//

import Foundation

protocol TaskListPresenterProtocol: AnyObject {
    
}

final class TaskListPresenter: TaskListViewOutputProtocol {
    var interactor: TaskListInteractorInputProtocol!
    var router: TaskListRouterInputProtocol!
    
    private unowned let view: TaskListViewInputProtocol
    
    required init(view: any TaskListViewInputProtocol) {
        self.view = view
    }
    
    func viewDidLoad() {
        
    }
}

// MARK: - TaskListInteractorOutputProtocol
extension TaskListPresenter: TaskListInteractorOutputProtocol {
    
}

extension TaskListPresenter: TaskListPresenterProtocol {
   

}
