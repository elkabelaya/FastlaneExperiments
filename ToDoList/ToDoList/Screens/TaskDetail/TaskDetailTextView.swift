//
//  TaskDetailTextView.swift
//  ToDoList
//
//  Created by Elka Belaya on 30.05.2022.
//

import SwiftUI

struct TaskDetailTextView: View {
    let title: String
    let value: String
    
    var body: some View {
        HStack(alignment: .center)  {
            Text(title)
            Spacer()
            Text(value)
        }
    }
}

struct TaskDetailTextView_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailTextView(title: "label",value: "value")
    }
}
