//
//  EditableTextView.swift
//  ToDoList
//
//  Created by Elka Belaya on 30.05.2022.
//

import SwiftUI

struct EditableTextView: View {
    let title: String
    let onChange: ((_ value: String) -> Void)?
    @Binding var value: String

    init(title: String, value: Binding<String>,
         onChange:  ((_ value: String) -> Void)? = nil) {
        self.title = title
        self._value = value
        self.onChange = onChange
    }
    
    var body: some View {
        HStack(alignment: .center)  {
            Text(title)
            TextField("", text: $value)
                .multilineTextAlignment(.trailing)
                .onChange(of: value) { newValue in
                    onChange?(newValue)
                }
        }
        .background(.white)
            
    }
}

struct EditableTextView_Previews: PreviewProvider {
    static var previews: some View {
        EditableTextView(title: "SomeTitle", value: .constant("text"))
    }
}

