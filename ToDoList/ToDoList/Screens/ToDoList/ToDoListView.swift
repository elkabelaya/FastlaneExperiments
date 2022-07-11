//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Elka Belaya on 29.05.2022.
//

import SwiftUI

struct ToDoListView<ViewModel:ToDoListViewModelProtocol>: View {
    @ObservedObject private var viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            List{
                NavigationLink {
                    AddTaskView(viewModel: AddTaskViewModel()) { task in
                        viewModel.addTask(task: task)
                    }
                } label: {
                    Text("Добавить новую задачу")
                        .accessibilityIdentifier(ToDoListViewIdentifiers.addButton.rawValue)
                }
                
                
                ForEach(viewModel.tasks, id: \.self) { task in
                    NavigationLink{
                        TaskDetailView(viewModel: TaskDetailViewModel(task: task)){ task, newTask in
                            viewModel.updateTask(task: task, newTask: newTask)
                        
                    }} label: {
                        ToDoListTaskView(model: task)
                            .accessibilityIdentifier(ToDoListViewIdentifiers.listItem.rawValue)
                    }
                }
                .onDelete{delete in
                    viewModel.delete(at: delete)
                }
            }
            .navigationBarTitle("Список задач")
            
        }.navigationViewStyle(.stack)
        
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(viewModel:
                        ToDoListViewModel(repository: SnapshotRepository()))
    }
}
