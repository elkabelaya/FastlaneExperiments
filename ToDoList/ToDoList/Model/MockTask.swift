//
//  MockTask.swift
//  ToDoList
//
//  Created by Elka Belaya on 30.05.2022.
//
struct MockTask {
    let id:String
    func getTask() -> Task{
        return Task(name: "MockTask\(id)", description: "MockTask\(id)", priority: .low, status: .tobeDone)
    }
}

