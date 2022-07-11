//
//  TaskDetailViewModel.swift
//  ToDoList
//
//  Created by Elka Belaya on 25.06.2022.
//

import Foundation
import Combine

protocol TaskDetailViewModelProtocol: ObservableObject {
    var task: Task { get }
    var taskName: String { get set }
    var taskDescription: String { get set }
    var taskPriority: Priority { get set }
    var taskStatus: Bool { get set }
    var taskStatusName: String { get set }
    var isValid: Bool { get set }
    var isEditable: Bool  { get set }
    var editedTask: Task  { get }
    
    func edit()
    func cancel()
    
}

final class  TaskDetailViewModel: TaskDetailViewModelProtocol {
    @Published var task: Task
    @Published var taskName: String
    @Published var taskDescription: String
    @Published var taskPriority: Priority
    @Published var taskStatus: Bool
    @Published var taskStatusName: String
    @Published var isValid: Bool = true
    @Published var isEditable: Bool = false
    private var cancellable: Set<AnyCancellable> = []
    
    var editedTask: Task  {
        get {
            .init(name: taskName,
                  description: taskDescription,
                  priority: taskPriority,
                  status: Status.status( for: taskStatus ))
        }
    }
    
    init(task: Task) {
        self.task = task
        taskName = task.name
        taskDescription = task.description
        taskPriority = task.priority
        taskStatus = task.status.boolValue
        taskStatusName = task.status.rawValue
        
        $taskName
        .receive(on: RunLoop.main)
        .sink { [weak self] _ in
            if let self = self {
                self.isValid = self.taskName.count > 0
            }
        }.store(in: &cancellable)
        
        $taskStatus.receive(on: RunLoop.main)
        .sink { [weak self] _ in
            if let self = self {
                self.taskStatusName = Status.status(for: self.taskStatus).rawValue
            }
        }.store(in: &cancellable)
    }
    
    func edit() {
        isEditable = true
    }
    
    func cancel() {
        taskName = task.name
        taskDescription = task.description
        taskPriority = task.priority
        taskStatus = task.status.boolValue
        taskStatusName = task.status.rawValue
        isEditable = false
    }
}
