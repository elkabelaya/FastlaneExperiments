//
//  AddTaskViewModelTests.swift
//  ToDoList
//
//  Created by Elka Belaya on 25.06.2022.
//


import XCTest
import Combine

final class AddTaskViewModelTests: XCTestCase {
    var cancellables: Set<AnyCancellable> = []
    
    override func setUp() {
        self.cancellables = []
    }
    
    func testIsValid_falseOnInit() throws {
        //Given
        let viewModel = AddTaskViewModel()
        
        //When
        
        // Then
        XCTAssertEqual(viewModel.isValid, false)
    }
    
    func testIsValid_false() throws {
        //Given
        let viewModel = AddTaskViewModel()
        let expectation = XCTestExpectation()
        viewModel.$isValid.dropFirst().sink { value in
            expectation.fulfill()
        }
        .store(in: &cancellables)
     
        //When
        viewModel.taskName = Mock.String.shortString
        viewModel.taskName = Mock.String.emptyString
        wait(for: [expectation], timeout: 1)
        
        // Then
        XCTAssertEqual(viewModel.isValid, false)
    }
    
    func testIsValid_true() throws {
        //Given
        let viewModel = AddTaskViewModel()
        let expectation = XCTestExpectation()
        viewModel.$isValid.dropFirst().sink { value in
            expectation.fulfill()
        }
        .store(in: &cancellables)
             
        //When
        viewModel.taskName = Mock.String.emptyString
        viewModel.taskName = Mock.String.shortString
        wait(for: [expectation], timeout: 1)
        
        // Then
        XCTAssertEqual(viewModel.isValid, true)
    }
    
    func testGetTask() throws {
        //Given
        let task = Task(name: Mock.String.shortString, description: Mock.String.shortString, priority: .medium, status: .tobeDone)
        let viewModel = AddTaskViewModel()
        
        //When
        viewModel.taskName = task.name
        viewModel.taskDescription = task.description
        viewModel.selectedPriority = task.priority
        let generatedTask = viewModel.getTask()
        
        // Then
        XCTAssertEqual(generatedTask?.name, task.name)
        XCTAssertEqual(generatedTask?.description, task.description)
        XCTAssertEqual(generatedTask?.priority, task.priority)
        XCTAssertEqual(generatedTask?.status, .tobeDone)
    }
    
    func testTaskStatusName_onChangeBoolStatus() throws {
        //Given
        let task = Task(name: Mock.String.shortString, description: Mock.String.shortString, priority: .medium, status: .tobeDone)
        let viewModel = TaskDetailViewModel(task: task)
        let newStatus = Status.done
        let expectation = XCTestExpectation()
        viewModel.$taskStatusName.dropFirst().sink { value in
            expectation.fulfill()
        }
        .store(in: &cancellables)
             
        //When
        viewModel.taskStatus = newStatus.boolValue
        wait(for: [expectation], timeout: 1)
        
        // Then
        XCTAssertEqual(viewModel.taskStatusName, newStatus.rawValue)
    }
    
}
