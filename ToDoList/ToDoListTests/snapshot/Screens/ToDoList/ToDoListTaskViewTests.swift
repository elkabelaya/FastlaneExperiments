//
//  ToDoListTaskViewTests.swift
//  ToDoListTests
//
//  Created by Elka Belaya on 24.06.2022.
//

import XCTest
import SwiftUI
import SnapshotTesting

final class ToDoListTaskViewTests: SnapshotTestCase {
    let size: CGSize = .init(width: 300, height: 50)
    
    func testToDoListTaskView_fireDone() throws {
        //Given
        let task = Task(name: Mock.String.shortString,
                        description: Mock.String.shortString,
                        priority: .fire,
                        status: .done)
        let view = ToDoListTaskView(model: task)
        let uiView: UIView  = UIHostingController(rootView: view).view
        
        //When
        
        // Then
        assertSnapshot(matching: uiView, as: .image(size: size))
    }
    
    func testToDoListTaskView_fireToBeDone() throws {
        //Given
        let task = Task(name: Mock.String.shortString,
                        description: Mock.String.shortString,
                        priority: .fire,
                        status: .tobeDone)
        let view = ToDoListTaskView(model: task)
        let uiView: UIView = UIHostingController(rootView: view).view
        
        //When
        
        // Then
        assertSnapshot(matching: uiView, as: .image(size: size))
    }
    
    func testToDoListTaskView_mediumDone() throws {
        //Given
        let task = Task(name: Mock.String.shortString,
                        description: Mock.String.shortString,
                        priority: .medium,
                        status: .done)
        let view = ToDoListTaskView(model: task)
        let uiView: UIView = UIHostingController(rootView: view).view
        
        //When
        
        // Then
        assertSnapshot(matching: uiView, as: .image(size: size))
    }
    
    func testToDoListTaskView_mediumToBeDone() throws {
        //Given
        let task = Task(name: Mock.String.shortString,
                        description: Mock.String.shortString,
                        priority: .medium,
                        status: .tobeDone)
        let view = ToDoListTaskView(model: task)
        let uiView: UIView = UIHostingController(rootView: view).view
        
        //When
        
        // Then
        assertSnapshot(matching: uiView, as: .image(size: size))
    }
    
    func testToDoListTaskView_lowDone() throws {
        //Given
        let task = Task(name: Mock.String.shortString,
                        description: Mock.String.shortString,
                        priority: .low,
                        status: .done)
        let view = ToDoListTaskView(model: task)
        let uiView: UIView = UIHostingController(rootView: view).view
        
        //When
        
        // Then
        assertSnapshot(matching: uiView, as: .image(size: size))
    }
    
    func testToDoListTaskView_lowToBeDone() throws {
        //Given
        let task = Task(name: Mock.String.shortString,
                        description: Mock.String.shortString,
                        priority: .low,
                        status: .tobeDone)
        let view = ToDoListTaskView(model: task)
        let uiView: UIView = UIHostingController(rootView: view).view
        
        //When
        
        // Then
        assertSnapshot(matching: uiView, as: .image(size: size))
    }
    
    func testToDoListTaskView_highDone() throws {
        //Given
        let task = Task(name: Mock.String.shortString,
                        description: Mock.String.shortString,
                        priority: .high,
                        status: .done)
        let view = ToDoListTaskView(model: task)
        let uiView: UIView = UIHostingController(rootView: view).view
        
        //When
        
        // Then
        assertSnapshot(matching: uiView, as: .image(size: size))
    }
    
    func testToDoListTaskView_highToBeDone() throws {
        //Given
        let task = Task(name: Mock.String.shortString,
                        description: Mock.String.shortString,
                        priority: .high,
                        status: .tobeDone)
        let view = ToDoListTaskView(model: task)
        let uiView: UIView = UIHostingController(rootView: view).view
        
        //When
        
        // Then
        assertSnapshot(matching: uiView, as: .image(size: size))
    }
    
    func testToDoListTaskView_emptyName() throws {
        //Given
        let task = Task(name: Mock.String.emptyString,
                        description: Mock.String.shortString,
                        priority: .high,
                        status: .tobeDone)
        let view = ToDoListTaskView(model: task)
        let uiView: UIView = UIHostingController(rootView: view).view
        
        //When
        
        // Then
        assertSnapshot(matching: uiView, as: .image(size: size))
    }
    
    func testToDoListTaskView_emptyDescription() throws {
        //Given
        let task = Task(name: Mock.String.shortString,
                        description: Mock.String.emptyString,
                        priority: .high,
                        status: .tobeDone)
        let view = ToDoListTaskView(model: task)
        let uiView: UIView = UIHostingController(rootView: view).view
        
        //When
        
        // Then
        assertSnapshot(matching: uiView, as: .image(size: size))
    }
    
    func testToDoListTaskView_emptyNameEmptyDescription() throws {
        //Given
        let task = Task(name: Mock.String.emptyString,
                        description: Mock.String.emptyString,
                        priority: .high,
                        status: .tobeDone)
        let view = ToDoListTaskView(model: task)
        let uiView: UIView = UIHostingController(rootView: view).view
        
        //When
        
        // Then
        assertSnapshot(matching: uiView, as: .image(size: size))
    }
    
    func testToDoListTaskView_longName() throws {
        //Given
        let task = Task(name: Mock.String.longString,
                        description: Mock.String.shortString,
                        priority: .high,
                        status: .tobeDone)
        let view = ToDoListTaskView(model: task)
        let uiView: UIView = UIHostingController(rootView: view).view
        
        //When
        
        // Then
        assertSnapshot(matching: uiView, as: .image(size: size))
    }
    
    func testToDoListTaskView_longDescription() throws {
        //Given
        let task = Task(name: Mock.String.shortString,
                        description: Mock.String.longString,
                        priority: .high,
                        status: .tobeDone)
        let view = ToDoListTaskView(model: task)
        let uiView: UIView = UIHostingController(rootView: view).view
        
        //When
        
        // Then
        assertSnapshot(matching: uiView, as: .image(size: size))
    }
    
    func testToDoListTaskView_longNameLongDescription() throws {
        //Given
        let task = Task(name: Mock.String.longString,
                        description: Mock.String.longString,
                        priority: .high,
                        status: .tobeDone)
        let view = ToDoListTaskView(model: task)
        let uiView: UIView = UIHostingController(rootView: view).view
        
        //When
        
        // Then
        assertSnapshot(matching: uiView, as: .image(size: size))
    }
}
