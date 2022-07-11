//
//  ToDoListScreenshots.swift
//  ToDoListScreenshots
//
//  Created by Elka Belaya on 10.07.2022.
//

import XCTest

final class ToDoListScreenshots: XCTestCase {
    var app: XCUIApplication!

        func testSnapshots() {
            let app = XCUIApplication()
            setupSnapshot(app)
            app.launch()
            //Given
            app.buttons[ToDoListViewIdentifiers.addButton.rawValue].tap()
            let inputTitle = app.textFields[AddTaskViewIdentifiers.titleField.rawValue]
            let inputDescription = app.textFields[AddTaskViewIdentifiers.descriptionField.rawValue]
            
            //When
            inputTitle.tap()
            inputTitle.typeText("Помыть посуду")
            inputDescription.tap()
            inputDescription.typeText("Средтво для мытья посуды стоит на верхней полке шкафа")
            
            //Then
            snapshot("1AddTask")
            
            //When
            app.buttons[AddTaskViewIdentifiers.appendButton.rawValue].tap()
            for item in ["Купить айфон": "У Маши старый разбился ((",
                         "Заказать пиццу": "Придут Петровы, они любят маргариту"] {
                app.buttons[ToDoListViewIdentifiers.addButton.rawValue].tap()
                let inputTitle = app.textFields[AddTaskViewIdentifiers.titleField.rawValue]
                let inputDescription = app.textFields[AddTaskViewIdentifiers.descriptionField.rawValue]
                inputTitle.tap()
                inputTitle.typeText(item.key)
                inputDescription.tap()
                inputDescription.typeText(item.value)
                app.buttons[AddTaskViewIdentifiers.appendButton.rawValue].tap()
            }
            
            
            //Then
            snapshot("0Main")
            
            //When
            app.staticTexts[ToDoListViewIdentifiers.listItem.rawValue].firstMatch.tap()
            app.buttons[TaskDetailViewIdentifiers.editButton.rawValue].tap()
            
            //Then
            snapshot("2EditTask")
                                                
        }
}
