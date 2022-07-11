//
//  LabeledTextView.swift
//  ToDoList
//
//  Created by Elka Belaya on 29.05.2022.
//

import SwiftUI

struct LabeledTextView: View {
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
        VStack(alignment: .leading)  {
            Text(title)
            TextField("Введите текст", text: $value)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 16, style: .circular)
                                .stroke( Color.black, lineWidth: 2)
                        )
                .onChange(of: value) { newValue in
                    onChange?(newValue)
                }
        }
    }
}

struct LabeledTextView_Previews: PreviewProvider {
    static var previews: some View {
        LabeledTextView(title: "SomeTitle", value: .constant("text"))
    }
}
