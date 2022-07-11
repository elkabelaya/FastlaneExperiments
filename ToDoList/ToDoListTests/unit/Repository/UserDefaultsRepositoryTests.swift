//
//  UserDefaultsRepositoryTests.swift
//  ToDoListTests
//
//  Created by Elka Belaya on 26.06.2022.
//

import XCTest
import Combine

final class UserDefaultsRepositoryTests: XCTestCase {
    
    override func setUp() {
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
    }
    
    func testAddTask() throws {
        //Given
        let repository = UserDefaultsRepository()
        let task = Task(name: Mock.String.shortString, description: Mock.String.shortString, priority: .low, status: .tobeDone)
        
        //When
        repository.addTask(task: task)
        
        // Then
        XCTAssertEqual(repository.tasks.count, 1)
        XCTAssertEqual(repository.tasks[0].id, task.id)
    }
    
    func testRemoveTask() throws {
        //Given
        let repository = UserDefaultsRepository()
        let task = Task(name: Mock.String.shortString, description: Mock.String.shortString, priority: .low, status: .tobeDone)
        
        //When
        repository.addTask(task: task)
        repository.removeTask(at: 0)
        
        // Then
        XCTAssertEqual(repository.tasks.count, 0)
    }
    
    func testUpdateTask() throws {
        //Given
        let repository = UserDefaultsRepository()
        let task = Task(name: Mock.String.shortString, description: Mock.String.shortString, priority: .low, status: .tobeDone)
        let changedTask = Task(name: Mock.String.shortString, description: Mock.String.shortString, priority: .low, status: .tobeDone)
        //When
        repository.addTask(task: task)
        repository.updateTask(task: task, newTask: changedTask)
        
        // Then
        XCTAssertEqual(repository.tasks.count, 1)
        XCTAssertEqual(repository.tasks[0].id, changedTask.id)
    }
    
    func testGetTasks_betweenInstances() throws {
        //Given
        let repository = UserDefaultsRepository()
        
        let task = Task(name: Mock.String.shortString, description: Mock.String.shortString, priority: .low, status: .tobeDone)
        
        //When
        repository.addTask(task: task)
        
        // Then
        let newRepository = UserDefaultsRepository()
        XCTAssertEqual(newRepository.tasks.count, 1)
        XCTAssertEqual(newRepository.tasks[0].id, task.id)
    }
    
}

