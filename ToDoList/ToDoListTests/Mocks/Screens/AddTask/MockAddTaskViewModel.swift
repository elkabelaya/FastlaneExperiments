//
//  MockAddTaskViewModel.swift
//  ToDoList
//
//  Created by Elka Belaya on 25.06.2022.
//
import SwiftUI

class MockAddTaskViewModel: AddTaskViewModelProtocol {
    @Published var taskName: String = ""
    @Published var taskDescription: String = ""
    @Published var selectedPriority: Priority = .low
    @Published var isValid: Bool = false
    
    func getTask() -> Task? {
        return nil
    }
}
