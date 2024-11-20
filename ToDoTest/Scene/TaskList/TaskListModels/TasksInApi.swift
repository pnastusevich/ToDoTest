//
//  TasksInApi.swift
//  ToDoTest
//
//  Created by Паша Настусевич on 19.11.24.
//

import Foundation

struct TasksInApi: Decodable {
    
    let todos: [Tasks]
}
    struct Tasks: Decodable {
        let id: Int
        let title: String
        let description: String?
        let isCompleted: Bool
        let createdAt: Date
}
