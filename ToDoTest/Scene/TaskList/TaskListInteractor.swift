//
//  TaskListInteractor.swift
//  ToDoTest
//
//  Created by Паша Настусевич on 19.11.24.
//

import Foundation

protocol TaskListInteractorInputProtocol {
    init(storageManager: StorageManagerProtocol, networkManager: NetworkManagerProtocol, presenter: TaskListInteractorOutputProtocol)
    
}

protocol TaskListInteractorOutputProtocol: AnyObject {
    
}

final class TaskListInteractor: TaskListInteractorInputProtocol {
    
    private let storageManager: StorageManagerProtocol
    private let networkManager: NetworkManagerProtocol
    
    private unowned let presenter: TaskListInteractorOutputProtocol
    
    required init(storageManager: StorageManagerProtocol, networkManager: NetworkManagerProtocol, presenter: TaskListInteractorOutputProtocol) {
        self.storageManager = storageManager
        self.networkManager = networkManager
        self.presenter = presenter
    }
    
    // MARK: - Work in Data - CRUD
    
}
