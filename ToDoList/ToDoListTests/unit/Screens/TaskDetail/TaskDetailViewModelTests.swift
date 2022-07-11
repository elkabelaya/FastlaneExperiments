//
//  TaskDetailViewModelTests.swift
//  ToDoList
//
//  Created by Elka Belaya on 25.06.2022.
//

import XCTest
import Combine

final class TaskDetailViewModelTests: XCTestCase {
    var cancellables: Set<AnyCancellable> = []
    
    override func setUp() {
        self.cancellables = []
    }
    
    func testInit_nameDescriptionPrioriy() throws {
        //Given
        let task = Task(name: Mock.String.shortString, description: Mock.String.longString, priority: .medium, status: .done)
        let viewModel = TaskDetailViewModel(task: task)
     
        //When

        // Then
        XCTAssertEqual(viewModel.taskName, task.name)
        XCTAssertEqual(viewModel.taskDescription, task.description)
        XCTAssertEqual(viewModel.taskPriority, task.priority)
    }
    
    func testInit_satusDone() throws {
        //Given
        let task = Task(name: Mock.String.shortString, description: Mock.String.longString, priority: .medium, status: .done)
        let viewModel = TaskDetailViewModel(task: task)
     
        //When

        // Then
        XCTAssertEqual(viewModel.taskStatus, true)
        XCTAssertEqual(viewModel.taskStatusName, Status.done.rawValue)
    }
    
    func testInit_satusToBeDone() throws {
        //Given
        let task = Task(name: Mock.String.shortString, description: Mock.String.longString, priority: .medium, status: .tobeDone)
        let viewModel = TaskDetailViewModel(task: task)
     
        //When

        // Then
        XCTAssertEqual(viewModel.taskStatus, false)
        XCTAssertEqual(viewModel.taskStatusName, Status.tobeDone.rawValue)
    }
    
    func testEdit_beforeCall() throws {
        //Given
        let task = Task(name: Mock.String.shortString, description: Mock.String.longString, priority: .medium, status: .tobeDone)
        let viewModel = TaskDetailViewModel(task: task)
     
        //When
        
        
        // Then
        XCTAssertEqual(viewModel.isEditable, false)
    }
    
    func testEdit_afterCall() throws {
        //Given
        let task = Task(name: Mock.String.shortString, description: Mock.String.longString, priority: .medium, status: .tobeDone)
        let viewModel = TaskDetailViewModel(task: task)
     
        //When
        viewModel.edit()
        
        // Then
        XCTAssertEqual(viewModel.isEditable, true)
    }
    
    func testCancel_ifChanged() throws {
        //Given
        let task = Task(name: Mock.String.shortString, description: Mock.String.shortString, priority: .medium, status: .tobeDone)
        let viewModel = TaskDetailViewModel(task: task)
     
        //When
        viewModel.edit()
        viewModel.taskName = Mock.String.longString
        viewModel.taskDescription = Mock.String.longString
        viewModel.taskDescription = Mock.String.longString
        viewModel.taskStatus = !viewModel.taskStatus
        
        viewModel.cancel()
        
        // Then
        XCTAssertEqual(viewModel.isEditable, false)
        XCTAssertEqual(viewModel.taskName, task.name)
        XCTAssertEqual(viewModel.taskDescription, task.description)
        XCTAssertEqual(viewModel.taskStatus, task.status.boolValue)
        XCTAssertEqual(viewModel.taskPriority, task.priority)
    }
    
    func testCancel_ifNotChanged() throws {
        //Given
        let task = Task(name: Mock.String.shortString, description: Mock.String.shortString, priority: .medium, status: .tobeDone)
        let viewModel = TaskDetailViewModel(task: task)
     
        //When
        viewModel.edit()
        viewModel.cancel()
        
        // Then
        XCTAssertEqual(viewModel.isEditable, false)
        XCTAssertEqual(viewModel.taskName, task.name)
        XCTAssertEqual(viewModel.taskDescription, task.description)
        XCTAssertEqual(viewModel.taskStatus, task.status.boolValue)
        XCTAssertEqual(viewModel.taskPriority, task.priority)
    }
    
    func testEditedTask_ifChanged() throws {
        //Given
        let task = Task(name: Mock.String.shortString, description: Mock.String.shortString, priority: .medium, status: .tobeDone)
        let newDataTask = Task(name: Mock.String.longString, description: Mock.String.longString, priority: .high, status: .done)
        let viewModel = TaskDetailViewModel(task: task)
     
        //When
        viewModel.edit()
        viewModel.taskName = newDataTask.name
        viewModel.taskDescription = newDataTask.description
        viewModel.taskPriority = newDataTask.priority
        viewModel.taskStatus = newDataTask.status.boolValue
        
        let editedTask = viewModel.editedTask
        
        // Then
        XCTAssertEqual(editedTask.name, newDataTask.name)
        XCTAssertEqual(editedTask.description, newDataTask.description)
        XCTAssertEqual(editedTask.priority, newDataTask.priority)
        XCTAssertEqual(editedTask.status, newDataTask.status)
    }
    
    func testEditedTask_ifNotChanged() throws {
        //Given
        let task = Task(name: Mock.String.shortString, description: Mock.String.shortString, priority: .medium, status: .tobeDone)
        let viewModel = TaskDetailViewModel(task: task)
     
        //When
        let editedTask = viewModel.editedTask
        
        // Then
        XCTAssertEqual(editedTask.name, task.name)
        XCTAssertEqual(editedTask.description, task.description)
        XCTAssertEqual(editedTask.priority, task.priority)
        XCTAssertEqual(editedTask.status, task.status)
    }
    
    func testIsValid_false() throws {
        //Given
        let task = Task(name: Mock.String.shortString, description: Mock.String.shortString, priority: .medium, status: .tobeDone)
        let viewModel = TaskDetailViewModel(task: task)
        let expectation = XCTestExpectation()
        viewModel.$isValid.dropFirst().sink { value in
            expectation.fulfill()
        }
        .store(in: &cancellables)
     
        
        //When
        viewModel.taskName = Mock.String.emptyString
        wait(for: [expectation], timeout: 1)
        
        // Then
        XCTAssertEqual(viewModel.isValid, false)
    }
    
    func testIsValid_true() throws {
        //Given
        let task = Task(name: Mock.String.shortString, description: Mock.String.shortString, priority: .medium, status: .tobeDone)
        let viewModel = TaskDetailViewModel(task: task)
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
    
    func testTaskStatusName_onInit() throws {
        //Given
        let task = Task(name: Mock.String.shortString, description: Mock.String.shortString, priority: .medium, status: .tobeDone)
        let viewModel = TaskDetailViewModel(task: task)
        
        //When
        
        // Then
        XCTAssertEqual(viewModel.taskStatusName, task.status.rawValue)
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

