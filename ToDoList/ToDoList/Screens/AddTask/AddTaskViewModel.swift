//
//  AddTaskViewModel.swift
//  ToDoList
//
//  Created by Elka Belaya on 24.06.2022.
//

import Foundation
import Combine

protocol AddTaskViewModelProtocol: ObservableObject {
    var taskName: String { get set }
    var taskDescription: String  { get set}
    var selectedPriority: Priority  { get set}
    var isValid: Bool  { get set}
    func getTask() -> Task?
}

final class  AddTaskViewModel: AddTaskViewModelProtocol {
    @Published var taskName: String = ""
    @Published var taskDescription: String = ""
    @Published var selectedPriority: Priority = .low
    @Published var isValid: Bool = false
    private var cancellable: Set<AnyCancellable> = []
    
    init() {
        $taskName
        .receive(on: RunLoop.main)
        .sink { [weak self] _ in
            if let self = self {
                self.isValid = self.taskName.count > 0
            }
        }.store(in: &cancellable)
    }
    
    func getTask() -> Task? {
        return Task(name: taskName,
                    description: taskDescription,
                    priority: selectedPriority,
                    status: .tobeDone)
    }
}
