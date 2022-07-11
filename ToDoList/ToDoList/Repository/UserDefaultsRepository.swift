//
//  SharedUserRepository.swift
//  ToDoList
//
//  Created by Elka Belaya on 29.05.2022.
//

import Foundation

final class UserDefaultsRepository: RepositoryProtocol, ObservableObject {
    fileprivate let tasksKey: String = "tasksKey"
    @Published private(set) var tasks: [Task] = []
    var tasksPublisher: Published<[Task]>.Publisher { $tasks }
    
    init() {
        tasks = getTasks()
    }
    
    func addTask(task: Task) {
        tasks.append(task)
        saveTasks()
    }
    
    func removeTask(at index: Int) {
        tasks.remove(at: index)
        saveTasks()
    }
    
    func updateTask(task: Task, newTask: Task) {
        if let index:Int = tasks.firstIndex(of: task) {
            tasks[index] = newTask
            saveTasks()
        }
    }
    
    private func getTasks() -> [Task] {
        if let data: Data = UserDefaults.standard.data(forKey: tasksKey),
           let savedTasks = try? JSONDecoder().decode([Task].self, from: data) {
            return savedTasks
        }
        return []
    }

    private func saveTasks() {
        if let encodedData = try? JSONEncoder().encode(tasks) {
            UserDefaults.standard.set(encodedData, forKey: tasksKey)
        }
    }
    
}
