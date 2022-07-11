//
//  ButtonModifier.swift
//  ToDoList
//
//  Created by Elka Belaya on 30.05.2022.
//
import SwiftUI

struct ButtonModifier: ViewModifier {
    let color: Color
    func body(content: Content) -> some View {
        content
            .foregroundColor(color)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(color, lineWidth: 2)
                
            )
            .buttonStyle(BorderlessButtonStyle())
    }
}

extension Button {
    func appButtonStyle(color: Color) -> some View {
        modifier(ButtonModifier(color: color))
    }
}

struct ButtonModifier_Previews: PreviewProvider {
    static var previews: some View {
        Button("Tекст"){}
            .appButtonStyle(color: .green)
    }
}
