//
//  ToDoListViewModel.swift
//  ToDoList
//
//  Created by Elka Belaya on 29.05.2022.
//

import Foundation
import Combine

protocol ToDoListViewModelProtocol: ObservableObject {
    var tasks: [Task] { get }
    func delete(at offsets: IndexSet) -> Void
    func addTask(task: Task) -> Void
    func removeTask(at index: Int) -> Void
    func updateTask(task: Task, newTask: Task) -> Void
}

final class ToDoListViewModel: ToDoListViewModelProtocol {
    @Published var tasks: [Task] = []
    private var repository: any RepositoryProtocol
    private var cancellable: Set<AnyCancellable> = []
    
    init(repository: any RepositoryProtocol) {
        self.repository = repository
        self.repository
            .tasksPublisher
            .receive(on: RunLoop.main)
            .sink { [weak self] tasks in
                    self?.tasks = tasks
            }.store(in: &cancellable)
    }
    
    func delete(at offsets: IndexSet) {
        if let index: Int = offsets.first {
            repository.removeTask(at: index)
        }
    }
    
    func addTask(task: Task) {
        repository.addTask(task: task)
    }
    
    func removeTask(at index: Int) {
        repository.removeTask(at: index)
    }
    
    func updateTask(task: Task, newTask: Task){
        repository.updateTask(task: task, newTask: newTask)
    }
    
}
