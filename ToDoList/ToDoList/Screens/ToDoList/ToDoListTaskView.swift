//
//  ToDoListTaskView.swift
//  ToDoList
//
//  Created by Elka Belaya on 29.05.2022.
//

import SwiftUI

struct ToDoListTaskView: View {
    let model: Task
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(model.name)
                    .fontWeight(.bold)
                    
                Text(model.description)
            }
            Spacer()
            Image(systemName: model.priorityImageSystemName)
                .foregroundColor(model.priorityImageColor)
            Image(systemName: model.readyImageSystemName)
        }
    }
}

struct ToDoListTaskView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListTaskView(model: Task(name: "name",
                                     description: "description",
                                     priority: .fire,
                                     status: .tobeDone))
    }
}
