//
//  SnapshotTestCase.swift
//  ToDoListTests
//
//  Created by Elka Belaya on 25.06.2022.
//

import XCTest

///Базовыйклассдля Snapshot тестирования
open class SnapshotTestCase: XCTestCase{
    ///Устройство, на котором нужно запускать snapshot тесты
    private static let requiredDevice = "iPhone13,2"
    ///ВерсияОС, на которой нужно запускать snapshot тесты
    private static let requiredOSVersion = 16
    
    override open class func setUp() {
        super.setUp()
        let deviceModel = ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"]
        let osVersion = ProcessInfo().operatingSystemVersion
        guard deviceModel?.contains(requiredDevice) ?? false
        else {
            fatalError("Switch to using iPhone 12 for these tests.")
        }
        guard osVersion.majorVersion == requiredOSVersion
        else {
            fatalError("Switch to iOS \(requiredOSVersion) for these tests.")
        }
        
    }
    
}

