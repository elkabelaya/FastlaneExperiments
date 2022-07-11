//
//  MockToDoListViewModel.swift
//  ToDoList
//
//  Created by Elka Belaya on 25.06.2022.
//

import Foundation
class MockToDoListViewModel: ToDoListViewModelProtocol {
    @Published var tasks: [Task] = []
    func delete(at offsets: IndexSet) {}
    func addTask(task: Task) {}
    func removeTask(at index: Int) {}    
    func updateTask(task: Task, newTask: Task) {}
}
