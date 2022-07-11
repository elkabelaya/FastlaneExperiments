//
//  AddTaskView.swift
//  ToDoList
//
//  Created by Elka Belaya on 29.05.2022.
//

import SwiftUI

struct AddTaskView<ViewModel: AddTaskViewModelProtocol>: View {
    @ObservedObject var viewModel:  ViewModel
    let onSave: (_ task: Task) -> Void
    @Environment(\.presentationMode) var presentation
    init( viewModel:  ViewModel, onSave: @escaping ((_ task: Task) -> Void) ) {
        self.viewModel = viewModel
        self.onSave = onSave
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            LabeledTextView(title: "Название задачи *",
                            value: $viewModel.taskName)
            .accessibilityIdentifier(AddTaskViewIdentifiers.titleField.rawValue)
            LabeledTextView(title: "Описание",
                            value: $viewModel.taskDescription)
            .accessibilityIdentifier(AddTaskViewIdentifiers.descriptionField.rawValue)
            Spacer()
            PriorityPicker(selectedPriority: $viewModel.selectedPriority)
            Spacer()
            Text("* - обязательные поля для заполнения")
                .foregroundColor(.gray)
                .font(.system(size: 14))
            
            HStack {
                Spacer()
                Button("Добавить"){
                    if viewModel.isValid,
                    let task = viewModel.getTask() {
                        onSave(task)
                        presentation.wrappedValue.dismiss()
                    }
                }.appButtonStyle(color: viewModel.isValid ? .black: .gray)
                    .accessibilityIdentifier(AddTaskViewIdentifiers.appendButton.rawValue)
                Spacer()
            }
            Spacer()
        }.padding()
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView(viewModel: AddTaskViewModel()){_ in }
    }
}
