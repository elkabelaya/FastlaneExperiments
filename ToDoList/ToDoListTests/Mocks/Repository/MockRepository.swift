//
//  MockRepository.swift
//  ToDoList
//
//  Created by Elka Belaya on 25.06.2022.
//

import Foundation

final class MockRepository: RepositoryProtocol, ObservableObject {
    @Published var tasks: [Task] = []
    var addTaskCalled: Task?
    var removeTaskCalled: Int?
    var updateTaskCalled: (Task, Task)?
    
    var tasksPublisher: Published<[Task]>.Publisher { $tasks }

    func addTask(task: Task) {
        addTaskCalled = task
    }
    
    func removeTask(at index: Int) {
        removeTaskCalled = index
    }
    
    func updateTask(task: Task, newTask: Task) {
        updateTaskCalled = (task, newTask)
    }
}
