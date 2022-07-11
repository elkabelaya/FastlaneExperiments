//
//  ToDoListViewModelTests.swift
//  ToDoList
//
//  Created by Elka Belaya on 25.06.2022.
//

import XCTest
import Combine

final class ToDoListViewModelTests: XCTestCase {
    var cancellables: Set<AnyCancellable> = []
    
    override func setUp() {
        self.cancellables = []
    }
    
    func testTasks_updateFromRepository() throws {
        //Given
        let repository = MockRepository()
        let viewModel = ToDoListViewModel(repository: repository)
        let expectation = XCTestExpectation()
        let task = Task(name: Mock.String.shortString, description: Mock.String.shortString, priority: .fire, status: .done)
        viewModel.$tasks.dropFirst().sink { value in
            expectation.fulfill()
        }
        .store(in: &cancellables)
     
        //When
        repository.tasks.append(task)
        wait(for: [expectation], timeout: 1)

        // Then
        XCTAssertEqual(viewModel.tasks, repository.tasks)
    }
    
    func testAddTask_calledRepository() throws {
        //Given
        let repository = MockRepository()
        let viewModel = ToDoListViewModel(repository: repository)
        let task = Task(name: Mock.String.shortString, description: Mock.String.shortString, priority: .fire, status: .done)
        
        //When
        viewModel.addTask(task: task)
        
        // Then
        XCTAssertEqual(repository.addTaskCalled, task)
    }
    
    func testRemoveTask_calledRepository() throws {
        //Given
        let repository = MockRepository()
        let viewModel = ToDoListViewModel(repository: repository)
        let ind = 5
        
        //When
        viewModel.removeTask(at: ind)
        
        // Then
        XCTAssertEqual(repository.removeTaskCalled, ind)
    }
    
    func testUpdateTask_calledRepository() throws {
        //Given
        let repository = MockRepository()
        let viewModel = ToDoListViewModel(repository: repository)
        let task = Task(name: Mock.String.shortString, description: Mock.String.shortString, priority: .fire, status: .done)
        let newTask = Task(name: Mock.String.shortString, description: Mock.String.shortString, priority: .low, status: .done)
        
        //When
        viewModel.updateTask(task: task, newTask: newTask)
        
        // Then
        XCTAssertEqual(repository.updateTaskCalled?.0, task)
        XCTAssertEqual(repository.updateTaskCalled?.1, newTask)
    }
}
