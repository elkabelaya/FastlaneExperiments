//
//  TaskDetail.swift
//  ToDoList
//
//  Created by Elka Belaya on 30.05.2022.
//

import SwiftUI

struct TaskDetailView<ViewModel: TaskDetailViewModelProtocol>: View {
    @ObservedObject var viewModel:  ViewModel
    let onSave: (_ task: Task, _ newTask: Task) -> Void
    
    init(viewModel:  ViewModel,
         onSave: @escaping (_ task: Task, _ newTask: Task) -> Void) {
        self.viewModel = viewModel
        self.onSave = onSave
    }
    
    var body: some View {
        List {
            Section {
                if viewModel.isEditable {
                    EditableTextView(title: "Задача", value: $viewModel.taskName)
                } else {
                    TaskDetailTextView(title: "Задача", value: viewModel.taskName)
                }
            }
            
            Section {
                if viewModel.isEditable {
                    EditableTextView(title: "Описание", value: $viewModel.taskDescription)
                } else {
                    TaskDetailTextView(title: "Описание", value: viewModel.taskDescription)
                }
            }
            
            Section {
                if viewModel.isEditable {
                    PriorityPicker(selectedPriority: $viewModel.taskPriority)
                } else {
                    TaskDetailTextView(title: "Приоритет", value: viewModel.taskPriority.rawValue)
                }
            }
            
            Section {
                if viewModel.isEditable {
                    Toggle("Статус", isOn: $viewModel.taskStatus)
                } else {
                    TaskDetailTextView(title: "Статус", value: viewModel.taskStatusName)
                }
            }
            
            Section {
                if viewModel.isEditable {
                    buttons()
                } else {
                    Button("Редактировать") {
                        viewModel.edit()
                    }
                    .accessibilityIdentifier(TaskDetailViewIdentifiers.editButton.rawValue)
                }
            }
        }.navigationBarTitle("Задача")
    }

    
    fileprivate func buttons() -> some View {
        return HStack {
            Button("Сохранить"){
                onSave(viewModel.task, viewModel.editedTask)
            }.appButtonStyle(color: viewModel.isValid ? .green: .gray)
            Spacer()
            Button("Отменить"){
                viewModel.cancel()
            }
            .appButtonStyle(color: .red)
        }
    }
    
}

struct TaskDetail_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailView(viewModel: TaskDetailViewModel(task: MockTask(id:"1").getTask())){_,_  in }
    }
}
