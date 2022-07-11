//
//  SnapshotRepository.swift
//  ToDoList
//
//  Created by Elka Belaya on 29.05.2022.
//

import Foundation

final class SnapshotRepository: RepositoryProtocol, ObservableObject {
    @Published var tasks: [Task] = [Task(name: "mock1", description: "description1", priority: .low, status: .tobeDone),
                                                 Task(name: "mock2", description: "description2", priority: .medium, status: .tobeDone),
                                                 Task(name: "mock3", description: "description3", priority: .high, status: .done),
                                                 Task(name: "mock4", description: "description4", priority: .fire, status: .tobeDone)]
    var tasksPublisher: Published<[Task]>.Publisher { $tasks }
    
    func addTask(task: Task) {
        //do nothing
    }
    
    func removeTask(at index: Int) {
        //do nothing
    }
    
    func updateTask(task: Task, newTask: Task) {
        //do nothing
    }
}
