//
//  ToDoListViewTests.swift
//  ToDoListTests
//
//  Created by Elka Belaya on 24.06.2022.
//

import XCTest
import SnapshotTesting
import SwiftUI

final class ToDoListViewTests: SnapshotTestCase {
    
    func testToDoListView_Empty()throws {
        //Given
        let viewModel = MockToDoListViewModel()
        let view = ToDoListView(viewModel: viewModel)
        let sutViewController = UIHostingController(rootView: view)
        
        //When
        viewModel.tasks = []
        
        // Then
        assertSnapshot(matching: sutViewController, as: .image(on:.iPhone12))
    }
    
    func testToDoListView_OneItem()throws {
        //Given
        let viewModel = MockToDoListViewModel()
        let view = ToDoListView(viewModel: viewModel)
        let sutViewController = UIHostingController(rootView: view)
        let tasks = [Task(name: Mock.String.shortString,
                          description: Mock.String.shortString,
                          priority: .fire,
                          status: .done)]
        
        //When
        viewModel.tasks = tasks
        
        // Then
        assertSnapshot(matching: sutViewController, as: .image(on:.iPhone12))
    }
    
    func testToDoListView_LargeList()throws {
        //Given
        let viewModel = MockToDoListViewModel()
        let view = ToDoListView(viewModel: viewModel)
        let sutViewController = UIHostingController(rootView: view)
        let tasks = [Task(name: Mock.String.shortString,
                          description: Mock.String.shortString,
                          priority: .fire,
                          status: .done),
                     Task(name: Mock.String.shortString,
                          description: Mock.String.shortString,
                          priority: .high,
                          status: .tobeDone),
                     Task(name: Mock.String.shortString,
                          description: Mock.String.shortString,
                          priority: .low,
                          status: .done),
                     Task(name: Mock.String.shortString,
                          description: Mock.String.shortString,
                          priority: .medium,
                          status: .tobeDone),
                     Task(name: Mock.String.shortString,
                          description: Mock.String.shortString,
                          priority: .fire,
                          status: .done),
                     Task(name: Mock.String.shortString,
                          description: Mock.String.shortString,
                          priority: .high,
                          status: .tobeDone),
                     Task(name: Mock.String.shortString,
                          description: Mock.String.shortString,
                          priority: .fire,
                          status: .done),
                     Task(name: Mock.String.shortString,
                          description: Mock.String.shortString,
                          priority: .low,
                          status: .tobeDone),
                     Task(name: Mock.String.shortString,
                          description: Mock.String.shortString,
                          priority: .medium,
                          status: .done),
                     Task(name: Mock.String.shortString,
                          description: Mock.String.shortString,
                          priority: .fire,
                          status: .tobeDone),
                     Task(name: Mock.String.shortString,
                          description: Mock.String.shortString,
                          priority: .high,
                          status: .done),
                     Task(name: Mock.String.shortString,
                          description: Mock.String.shortString,
                          priority: .low,
                          status: .tobeDone),]
        //When
        viewModel.tasks = tasks
        
        // Then
        assertSnapshot(matching: sutViewController, as: .image(on:.iPhone12))
    }

}

