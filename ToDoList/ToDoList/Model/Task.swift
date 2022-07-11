//
//  Task.swift
//  ToDoList
//
//  Created by Elka Belaya on 29.05.2022.
//

import Foundation
import UIKit
import SwiftUI

/// Приоритет задачи
enum Priority: String, Codable, Equatable, CaseIterable {
    case fire = "Критический"
    case high = "Высокий"
    case medium = "Средний"
    case low = "Низкий"
}

/// Статус задачи
enum Status: String, Codable {
    case tobeDone = "Не выполнено"
    case done = "Выполнено"
    var boolValue: Bool { self == .done }
    static func status(for boolean: Bool) -> Status {
        if boolean { return Self.done }
        return Self.tobeDone
    }
}

/// Описание задачи
struct Task: Codable, Hashable {

    var id: String = UUID().uuidString
    let name: String
    let description: String
    let priority: Priority
    let status: Status
    
    var priorityImageSystemName: String {
        switch priority {
        case .low:
            return "chevron.down"
        case .medium:
            return "equal"
        case .high:
            return "chevron.up"
        case .fire:
            return "flame"
        }
    }
    
    var priorityImageColor: Color {
        switch priority {
        case .low:
            return .green
        case .medium:
            return .black
        case .high:
            return .orange
        case .fire:
            return .red
        }
    }
    
    var readyImageSystemName: String {
        switch status {
        case .tobeDone:
            return "square"
        case .done:
            return "checkmark.square"
        }
        
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
