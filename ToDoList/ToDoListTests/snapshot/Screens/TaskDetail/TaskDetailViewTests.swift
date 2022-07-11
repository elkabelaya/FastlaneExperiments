//
//  TaskDetailViewTests.swift
//  ToDoListTests
//
//  Created by Elka Belaya on 24.06.2022.
//

import XCTest
import SwiftUI
import SnapshotTesting

final class TaskDetailViewTests: SnapshotTestCase {
    
    func testTaskDetailView_hasAllFieldsNotEditable()throws {
        //Given
        let viewModel = MockTaskDetailViewModel()
        let view = TaskDetailView(viewModel: viewModel) {_,_ in }
        let sutViewController = UIHostingController(rootView: view)
        
        //When
        viewModel.taskName = Mock.String.shortString
        viewModel.taskDescription = Mock.String.shortString
        viewModel.taskPriority = .high
        viewModel.taskStatus = true
        viewModel.taskStatusName = Status.status(for: true).rawValue
        
        // Then
        assertSnapshot(matching: sutViewController, as: .image(on:.iPhone12))
    }
    
    func testTaskDetailView_noNameNotEditable()throws {
        //Given
        let viewModel = MockTaskDetailViewModel()
        let view = TaskDetailView(viewModel: viewModel) {_,_ in }
        let sutViewController = UIHostingController(rootView: view)
        
        //When
        viewModel.taskName = Mock.String.emptyString
        viewModel.taskDescription = Mock.String.shortString
        viewModel.taskPriority = .high
        viewModel.taskStatus = true
        viewModel.taskStatusName = Status.status(for: true).rawValue
        
        // Then
        assertSnapshot(matching: sutViewController, as: .image(on:.iPhone12))
    }
    
    func testTaskDetailView_noDescriptionNotEditable()throws {
        //Given
        let viewModel = MockTaskDetailViewModel()
        let view = TaskDetailView(viewModel: viewModel) {_,_ in }
        let sutViewController = UIHostingController(rootView: view)
        
        //When
        viewModel.taskName = Mock.String.shortString
        viewModel.taskDescription = Mock.String.emptyString
        viewModel.taskPriority = .high
        viewModel.taskStatus = true
        viewModel.taskStatusName = Status.status(for: true).rawValue
        
        // Then
        assertSnapshot(matching: sutViewController, as: .image(on:.iPhone12))
    }
    
    func testTaskDetailView_noNameNoDescriptionNotEditable()throws {
        //Given
        let viewModel = MockTaskDetailViewModel()
        let view = TaskDetailView(viewModel: viewModel) {_,_ in }
        let sutViewController = UIHostingController(rootView: view)
        
        //When
        viewModel.taskName = Mock.String.emptyString
        viewModel.taskDescription = Mock.String.emptyString
        viewModel.taskPriority = .high
        viewModel.taskStatus = true
        viewModel.taskStatusName = Status.status(for: true).rawValue
        
        // Then
        assertSnapshot(matching: sutViewController, as: .image(on:.iPhone12))
    }
    
    func testTaskDetailView_highNotEditable()throws {
        //Given
        let viewModel = MockTaskDetailViewModel()
        let view = TaskDetailView(viewModel: viewModel) {_,_ in }
        let sutViewController = UIHostingController(rootView: view)
        
        //When
        viewModel.taskName = Mock.String.shortString
        viewModel.taskDescription = Mock.String.shortString
        viewModel.taskPriority = .high
        viewModel.taskStatus = true
        viewModel.taskStatusName = Status.status(for: true).rawValue
        
        // Then
        assertSnapshot(matching: sutViewController, as: .image(on:.iPhone12))
    }
    
    func testTaskDetailView_lowNotEditable()throws {
        //Given
        let viewModel = MockTaskDetailViewModel()
        let view = TaskDetailView(viewModel: viewModel) {_,_ in }
        let sutViewController = UIHostingController(rootView: view)
        
        //When
        viewModel.taskName = Mock.String.shortString
        viewModel.taskDescription = Mock.String.shortString
        viewModel.taskPriority = .low
        viewModel.taskStatus = true
        viewModel.taskStatusName = Status.status(for: true).rawValue
        
        // Then
        assertSnapshot(matching: sutViewController, as: .image(on:.iPhone12))
    }
    
    func testTaskDetailView_mediumNotEditable()throws {
        //Given
        let viewModel = MockTaskDetailViewModel()
        let view = TaskDetailView(viewModel: viewModel) {_,_ in }
        let sutViewController = UIHostingController(rootView: view)
        
        //When
        viewModel.taskName = Mock.String.shortString
        viewModel.taskDescription = Mock.String.shortString
        viewModel.taskPriority = .medium
        viewModel.taskStatus = true
        viewModel.taskStatusName = Status.status(for: true).rawValue
        
        // Then
        assertSnapshot(matching: sutViewController, as: .image(on:.iPhone12))
    }
    
    func testTaskDetailView_fireNotEditable()throws {
        //Given
        let viewModel = MockTaskDetailViewModel()
        let view = TaskDetailView(viewModel: viewModel) {_,_ in }
        let sutViewController = UIHostingController(rootView: view)
        
        //When
        viewModel.taskName = Mock.String.shortString
        viewModel.taskDescription = Mock.String.shortString
        viewModel.taskPriority = .fire
        viewModel.taskStatus = true
        viewModel.taskStatusName = Status.status(for: true).rawValue
        
        // Then
        assertSnapshot(matching: sutViewController, as: .image(on:.iPhone12))
    }
    
    func testTaskDetailView_doneNotEditable()throws {
        //Given
        let viewModel = MockTaskDetailViewModel()
        let view = TaskDetailView(viewModel: viewModel) {_,_ in }
        let sutViewController = UIHostingController(rootView: view)
        
        //When
        viewModel.taskName = Mock.String.shortString
        viewModel.taskDescription = Mock.String.shortString
        viewModel.taskPriority = .fire
        viewModel.taskStatus = true
        viewModel.taskStatusName = Status.status(for: true).rawValue
        
        // Then
        assertSnapshot(matching: sutViewController, as: .image(on:.iPhone12))
    }
    
    func testTaskDetailView_toBeDoneNotEditable()throws {
        //Given
        let viewModel = MockTaskDetailViewModel()
        let view = TaskDetailView(viewModel: viewModel) {_,_ in }
        let sutViewController = UIHostingController(rootView: view)
        
        //When
        viewModel.taskName = Mock.String.shortString
        viewModel.taskDescription = Mock.String.shortString
        viewModel.taskPriority = .fire
        viewModel.taskStatus = false
        viewModel.taskStatusName = Status.status(for: false).rawValue
        
        // Then
        assertSnapshot(matching: sutViewController, as: .image(on:.iPhone12))
    }
    
    func testTaskDetailView_longNameNotEditable()throws {
        //Given
        let viewModel = MockTaskDetailViewModel()
        let view = TaskDetailView(viewModel: viewModel) {_,_ in }
        let sutViewController = UIHostingController(rootView: view)
        
        //When
        viewModel.taskName = Mock.String.longString
        viewModel.taskDescription = Mock.String.shortString
        viewModel.taskPriority = .fire
        viewModel.taskStatus = true
        viewModel.taskStatusName = Status.status(for: true).rawValue
        
        // Then
        assertSnapshot(matching: sutViewController, as: .image(on:.iPhone12))
    }
    
    func testTaskDetailView_longDescriptionNotEditable()throws {
        //Given
        let viewModel = MockTaskDetailViewModel()
        let view = TaskDetailView(viewModel: viewModel) {_,_ in }
        let sutViewController = UIHostingController(rootView: view)
        
        //When
        viewModel.taskName = Mock.String.shortString
        viewModel.taskDescription = Mock.String.longString
        viewModel.taskPriority = .fire
        viewModel.taskStatus = true
        viewModel.taskStatusName = Status.status(for: true).rawValue
        
        // Then
        assertSnapshot(matching: sutViewController, as: .image(on:.iPhone12))
    }
    
    func testTaskDetailView_hasAllFieldsEditable()throws {
        //Given
        let viewModel = MockTaskDetailViewModel()
        let view = TaskDetailView(viewModel: viewModel) {_,_ in }
        let sutViewController = UIHostingController(rootView: view)
        
        //When
        viewModel.isEditable = true
        viewModel.taskName = Mock.String.shortString
        viewModel.taskDescription = Mock.String.shortString
        viewModel.taskPriority = .high
        viewModel.taskStatus = true
        viewModel.taskStatusName = Status.status(for: true).rawValue
        
        // Then
        assertSnapshot(matching: sutViewController, as: .image(on:.iPhone12))
    }
    
    func testTaskDetailView_noNameEditable()throws {
        //Given
        let viewModel = MockTaskDetailViewModel()
        let view = TaskDetailView(viewModel: viewModel) {_,_ in }
        let sutViewController = UIHostingController(rootView: view)
        
        //When
        viewModel.isEditable = true
        viewModel.taskName = Mock.String.emptyString
        viewModel.isValid = false
        viewModel.taskDescription = Mock.String.shortString
        viewModel.taskPriority = .high
        viewModel.taskStatus = true
        viewModel.taskStatusName = Status.status(for: true).rawValue
        
        // Then
        assertSnapshot(matching: sutViewController, as: .image(on:.iPhone12))
    }
    
    func testTaskDetailView_noDescriptionEditable()throws {
        //Given
        let viewModel = MockTaskDetailViewModel()
        let view = TaskDetailView(viewModel: viewModel) {_,_ in }
        let sutViewController = UIHostingController(rootView: view)
        
        //When
        viewModel.isEditable = true
        viewModel.taskName = Mock.String.shortString
        viewModel.taskDescription = Mock.String.emptyString
        viewModel.taskPriority = .high
        viewModel.taskStatus = true
        viewModel.taskStatusName = Status.status(for: true).rawValue
        
        // Then
        assertSnapshot(matching: sutViewController, as: .image(on:.iPhone12))
    }
    
    func testTaskDetailView_noNameNoDescriptionEditable()throws {
        //Given
        let viewModel = MockTaskDetailViewModel()
        let view = TaskDetailView(viewModel: viewModel) {_,_ in }
        let sutViewController = UIHostingController(rootView: view)
        
        //When
        viewModel.isEditable = true
        viewModel.taskName = Mock.String.emptyString
        viewModel.isValid = false
        viewModel.taskDescription = Mock.String.emptyString
        viewModel.taskPriority = .high
        viewModel.taskStatus = true
        viewModel.taskStatusName = Status.status(for: true).rawValue
        
        // Then
        assertSnapshot(matching: sutViewController, as: .image(on:.iPhone12))
    }
    
    func testTaskDetailView_highEditable()throws {
        //Given
        let viewModel = MockTaskDetailViewModel()
        let view = TaskDetailView(viewModel: viewModel) {_,_ in }
        let sutViewController = UIHostingController(rootView: view)
        
        //When
        viewModel.isEditable = true
        viewModel.taskName = Mock.String.shortString
        viewModel.taskDescription = Mock.String.shortString
        viewModel.taskPriority = .high
        viewModel.taskStatus = true
        viewModel.taskStatusName = Status.status(for: true).rawValue
        
        // Then
        assertSnapshot(matching: sutViewController, as: .image(on:.iPhone12))
    }
    
    func testTaskDetailView_lowEditable()throws {
        //Given
        let viewModel = MockTaskDetailViewModel()
        let view = TaskDetailView(viewModel: viewModel) {_,_ in }
        let sutViewController = UIHostingController(rootView: view)
        
        //When
        viewModel.isEditable = true
        viewModel.taskName = Mock.String.shortString
        viewModel.taskDescription = Mock.String.shortString
        viewModel.taskPriority = .low
        viewModel.taskStatus = true
        viewModel.taskStatusName = Status.status(for: true).rawValue
        
        // Then
        assertSnapshot(matching: sutViewController, as: .image(on:.iPhone12))
    }
    
    func testTaskDetailView_mediumEditable()throws {
        //Given
        let viewModel = MockTaskDetailViewModel()
        let view = TaskDetailView(viewModel: viewModel) {_,_ in }
        let sutViewController = UIHostingController(rootView: view)
        
        //When
        viewModel.isEditable = true
        viewModel.taskName = Mock.String.shortString
        viewModel.taskDescription = Mock.String.shortString
        viewModel.taskPriority = .medium
        viewModel.taskStatus = true
        viewModel.taskStatusName = Status.status(for: true).rawValue
        
        // Then
        assertSnapshot(matching: sutViewController, as: .image(on:.iPhone12))
    }
    
    func testTaskDetailView_fireEditable()throws {
        //Given
        let viewModel = MockTaskDetailViewModel()
        let view = TaskDetailView(viewModel: viewModel) {_,_ in }
        let sutViewController = UIHostingController(rootView: view)
        
        //When
        viewModel.isEditable = true
        viewModel.taskName = Mock.String.shortString
        viewModel.taskDescription = Mock.String.shortString
        viewModel.taskPriority = .fire
        viewModel.taskStatus = true
        viewModel.taskStatusName = Status.status(for: true).rawValue
        
        // Then
        assertSnapshot(matching: sutViewController, as: .image(on:.iPhone12))
    }
    
    func testTaskDetailView_doneEditable()throws {
        //Given
        let viewModel = MockTaskDetailViewModel()
        let view = TaskDetailView(viewModel: viewModel) {_,_ in }
        let sutViewController = UIHostingController(rootView: view)
        
        //When
        viewModel.isEditable = true
        viewModel.taskName = Mock.String.shortString
        viewModel.taskDescription = Mock.String.shortString
        viewModel.taskPriority = .fire
        viewModel.taskStatus = true
        viewModel.taskStatusName = Status.status(for: true).rawValue
        
        // Then
        assertSnapshot(matching: sutViewController, as: .image(on:.iPhone12))
    }
    
    func testTaskDetailView_toBeDoneEditable()throws {
        //Given
        let viewModel = MockTaskDetailViewModel()
        let view = TaskDetailView(viewModel: viewModel) {_,_ in }
        let sutViewController = UIHostingController(rootView: view)
        
        //When
        viewModel.isEditable = true
        viewModel.taskName = Mock.String.shortString
        viewModel.taskDescription = Mock.String.shortString
        viewModel.taskPriority = .fire
        viewModel.taskStatus = false
        viewModel.taskStatusName = Status.status(for: false).rawValue
        
        // Then
        assertSnapshot(matching: sutViewController, as: .image(on:.iPhone12))
    }
    
    func testTaskDetailView_longNameEditable()throws {
        //Given
        let viewModel = MockTaskDetailViewModel()
        let view = TaskDetailView(viewModel: viewModel) {_,_ in }
        let sutViewController = UIHostingController(rootView: view)
        
        //When
        viewModel.isEditable = true
        viewModel.taskName = Mock.String.longString
        viewModel.taskDescription = Mock.String.shortString
        viewModel.taskPriority = .fire
        viewModel.taskStatus = true
        viewModel.taskStatusName = Status.status(for: true).rawValue
        
        // Then
        assertSnapshot(matching: sutViewController, as: .image(on:.iPhone12))
    }
    
    func testTaskDetailView_longDescriptionEditable()throws {
        //Given
        let viewModel = MockTaskDetailViewModel()
        let view = TaskDetailView(viewModel: viewModel) {_,_ in }
        let sutViewController = UIHostingController(rootView: view)
        
        //When
        viewModel.isEditable = true
        viewModel.taskName = Mock.String.shortString
        viewModel.taskDescription = Mock.String.longString
        viewModel.taskPriority = .fire
        viewModel.taskStatus = true
        viewModel.taskStatusName = Status.status(for: true).rawValue
        
        // Then
        assertSnapshot(matching: sutViewController, as: .image(on:.iPhone12))
    }
    
}
