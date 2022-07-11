//
//  PriorityPicker.swift
//  ToDoList
//
//  Created by Elka Belaya on 30.05.2022.
//

import SwiftUI

struct PriorityPicker: View {
    @Binding var selectedPriority: Priority
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Приоритет")
            Picker("Приоритет", selection: $selectedPriority) {
                ForEach(Priority.allCases, id: \.self) { value in
                                    Text(value.rawValue)
                                        .tag(value)
                                }
                        }
            .pickerStyle(.segmented)
        }
    }
}

struct PriorityPicker_Previews: PreviewProvider {
    static var previews: some View {
        PriorityPicker(selectedPriority: .constant(.medium))
    }
}
