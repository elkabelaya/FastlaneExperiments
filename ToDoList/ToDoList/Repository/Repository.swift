//
//  Repository.swift
//  ToDoList
//
//  Created by Elka Belaya on 29.05.2022.
//

import Foundation

protocol RepositoryProtocol: ObservableObject  {
    var tasksPublisher: Published<[Task]>.Publisher { get }
    func addTask(task: Task)
    func removeTask(at index: Int)
    func updateTask(task: Task, newTask: Task)
}

