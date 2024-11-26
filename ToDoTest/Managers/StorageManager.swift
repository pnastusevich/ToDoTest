//
//  StorageManager.swift
//  ToDoTest
//
//  Created by Паша Настусевич on 19.11.24.
//

import CoreData

protocol StorageManagerProtocol {
    func createTask(taskName: String, description: String, createdDate: Date, isCompleted: Bool, completion: (Task) -> Void)

    func fetchDataTask(completion: (Result<[Task], Error>) -> Void)
    
    func updateTask(_ task: Task, taskName: String, description: String, createdDate: Date, isCompleted: Bool)
    
    func doneTask(_ task: Task)
    
    func deleteTask(_ task: Task)
    
    func saveContext()
}

final class StorageManager: StorageManagerProtocol {
    
    // MARK: - Core Data stack
    private let viewContext: NSManagedObjectContext
    private let persistentContainer: NSPersistentContainer
    
    init(containerName: String = "TasksModel") {
          self.persistentContainer = NSPersistentContainer(name: containerName)
          self.persistentContainer.loadPersistentStores { _, error in
              if let error = error as NSError? {
                  fatalError("Unresolved error \(error), \(error.userInfo)")
              }
          }
          self.viewContext = persistentContainer.viewContext
      }
    
    // MARK: - CRUD
    func createTask(taskName: String, description: String, createdDate: Date, isCompleted: Bool, completion: (Task) -> Void) {
        let task = Task(context: viewContext)
        task.name = taskName
        task.subname = description
        task.createdAt = createdDate
        task.isCompleted = isCompleted
        saveContext()
        completion(task)
    }
    
    func fetchDataTask(completion: (Result<[Task], Error>) -> Void) {
        let fetchRequest = Task.fetchRequest()
        
        do {
            let task = try viewContext.fetch(fetchRequest)
            completion(.success(task))
        } catch let error {
            completion(.failure(error))
        }
    }
    
    func updateTask(_ task: Task, taskName: String, description: String, createdDate: Date, isCompleted: Bool) {
        task.name = taskName
        task.subname = description
        task.createdAt = createdDate
        task.isCompleted = isCompleted
        saveContext()
    }
    
    func doneTask(_ task: Task) {
        task.isCompleted.toggle()
        saveContext()
    }
    
    func deleteTask(_ task: Task) {
        viewContext.delete(task)
        saveContext()
    }
    
    // MARK: - Core Data Saving support
    func saveContext() {
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}

