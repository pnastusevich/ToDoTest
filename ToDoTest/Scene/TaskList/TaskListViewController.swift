//
//  ViewController.swift
//  ToDoTest
//
//  Created by Паша Настусевич on 19.11.24.
//

import UIKit

protocol TaskListViewInputProtocol: AnyObject {
    
}

protocol TaskListViewOutputProtocol: AnyObject {
    init(view: TaskListViewInputProtocol)
    func viewDidLoad()
}

final class TaskListViewController: UIViewController {
    
    var presenter: TaskListViewOutputProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        
        view.backgroundColor = .red
    }
}

// MARK: TaskListViewInputProtocol
extension TaskListViewController: TaskListViewInputProtocol {
    
}

