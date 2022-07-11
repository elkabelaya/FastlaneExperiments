//
//  MockTaskDetailViewModel.swift
//  ToDoList
//
//  Created by Elka Belaya on 25.06.2022.
//
import SwiftUI

class  MockTaskDetailViewModel: TaskDetailViewModelProtocol {
    var task: Task = .init(name: "", description: "", priority: .low, status: .tobeDone)
    @Published var taskName: String = ""
    @Published var taskDescription: String = ""
    @Published var taskPriority: Priority = .low
    @Published var taskStatus: Bool = false
    @Published var taskStatusName: String = ""
    @Published var isValid: Bool = true
    @Published var isEditable: Bool = false    
    var editedTask: Task = .init(name: "", description: "", priority: .low, status: .tobeDone)
    func edit() {}
    func cancel() {}
}

