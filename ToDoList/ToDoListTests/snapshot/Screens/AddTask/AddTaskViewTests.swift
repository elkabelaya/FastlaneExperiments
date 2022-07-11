//
//  AddTaskViewTests.swift
//  ToDoListTests
//
//  Created by Elka Belaya on 24.06.2022.
//

import XCTest
import SwiftUI
import SnapshotTesting

final class AddTaskViewTests: SnapshotTestCase {
    
    func testTaskDetailView_hasAllFields()throws {
        //Given
        let viewModel = MockAddTaskViewModel()
        let view = AddTaskView(viewModel: viewModel){_ in }
        
        //When
        viewModel.selectedPriority = .high
        viewModel.taskName = Mock.String.shortString
        viewModel.taskDescription = Mock.String.shortString
        let sutViewController = UIHostingController(rootView: view)
        
        // Then
        assertSnapshot(matching: sutViewController, as: .image(on:.iPhone12))
    }
    
    func testTaskDetailView_noName()throws {
        //Given
        let viewModel = MockAddTaskViewModel()
        let view = AddTaskView(viewModel: viewModel){_ in }
        
        //When
        viewModel.selectedPriority = .high
        viewModel.taskName = Mock.String.emptyString
        viewModel.taskDescription = Mock.String.shortString
        let sutViewController = UIHostingController(rootView: view)
        
        // Then
        assertSnapshot(matching: sutViewController, as: .image(on:.iPhone12))
    }
    
    func testTaskDetailView_noDescription()throws {
        //Given
        let viewModel = MockAddTaskViewModel()
        let view = AddTaskView(viewModel: viewModel){_ in }
        
        //When
        viewModel.selectedPriority = .high
        viewModel.taskName = Mock.String.shortString
        viewModel.taskDescription = Mock.String.emptyString
        let sutViewController = UIHostingController(rootView: view)
        
        // Then
        assertSnapshot(matching: sutViewController, as: .image(on:.iPhone12))
    }
    
    func testTaskDetailView_longName()throws {
        //Given
        let viewModel = MockAddTaskViewModel()
        let view = AddTaskView(viewModel: viewModel){_ in }
        
        //When
        viewModel.selectedPriority = .high
        viewModel.taskName = Mock.String.longString
        viewModel.taskDescription = Mock.String.shortString
        let sutViewController = UIHostingController(rootView: view)
        
        // Then
        assertSnapshot(matching: sutViewController, as: .image(on:.iPhone12))
    }
    
    func testTaskDetailView_longDescriptipon()throws {
        //Given
        let viewModel = MockAddTaskViewModel()
        let view = AddTaskView(viewModel: viewModel){_ in }
        
        //When
        viewModel.selectedPriority = .high
        viewModel.taskName = Mock.String.shortString
        viewModel.taskDescription = Mock.String.longString
        let sutViewController = UIHostingController(rootView: view)
        
        // Then
        assertSnapshot(matching: sutViewController, as: .image(on:.iPhone12))
    }
    
    func testTaskDetailView_longNameLongDescriptipon()throws {
        //Given
        let viewModel = MockAddTaskViewModel()
        let view = AddTaskView(viewModel: viewModel){_ in }
        
        //When
        viewModel.selectedPriority = .high
        viewModel.taskName = Mock.String.longString
        viewModel.taskDescription = Mock.String.longString
        let sutViewController = UIHostingController(rootView: view)
        
        // Then
        assertSnapshot(matching: sutViewController, as: .image(on:.iPhone12))
    }
    
    func testTaskDetailView_high()throws {
        //Given
        let viewModel = MockAddTaskViewModel()
        let view = AddTaskView(viewModel: viewModel){_ in }
        
        //When
        viewModel.selectedPriority = .high
        viewModel.taskName = Mock.String.shortString
        viewModel.taskDescription = Mock.String.shortString
        let sutViewController = UIHostingController(rootView: view)
        
        // Then
        assertSnapshot(matching: sutViewController, as: .image(on:.iPhone12))
    }
    
    func testTaskDetailView_fire()throws {
        //Given
        let viewModel = MockAddTaskViewModel()
        let view = AddTaskView(viewModel: viewModel){_ in }
        
        //When
        viewModel.selectedPriority = .fire
        viewModel.taskName = Mock.String.shortString
        viewModel.taskDescription = Mock.String.shortString
        let sutViewController = UIHostingController(rootView: view)
        
        // Then
        assertSnapshot(matching: sutViewController, as: .image(on:.iPhone12))
    }
    
    func testTaskDetailView_medium()throws {
        //Given
        let viewModel = MockAddTaskViewModel()
        let view = AddTaskView(viewModel: viewModel){_ in }
        
        //When
        viewModel.selectedPriority = .medium
        viewModel.taskName = Mock.String.shortString
        viewModel.taskDescription = Mock.String.shortString
        let sutViewController = UIHostingController(rootView: view)
        
        // Then
        assertSnapshot(matching: sutViewController, as: .image(on:.iPhone12))
    }
    
    func testTaskDetailView_low()throws {
        //Given
        let viewModel = MockAddTaskViewModel()
        let view = AddTaskView(viewModel: viewModel){_ in }
        
        //When
        viewModel.selectedPriority = .low
        viewModel.taskName = Mock.String.shortString
        viewModel.taskDescription = Mock.String.shortString
        let sutViewController = UIHostingController(rootView: view)
        
        // Then
        assertSnapshot(matching: sutViewController, as: .image(on:.iPhone12))
    }
}
