//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Elka Belaya on 29.05.2022.
//

import SwiftUI

@main
struct ToDoListApp: App {
    var body: some Scene {
        WindowGroup {
            ToDoListView(viewModel: ToDoListViewModel(repository: UserDefaultsRepository()))
            
        }
    }
}
