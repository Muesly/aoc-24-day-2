//
//  Day2Tests.swift
//  Day2Tests
//
//  Created by Short, Tony (T.) on 03/12/2024.
//

import Testing

@testable import Day2

struct Day2Tests {

    @Test func singleLevel() {
        let level = [7,6,4,2,1]
        #expect(PlantData.isLevelSafe(level) == true)
    }

    @Test("Levels", arguments: [[7, 6, 4, 2, 1],
                                [1, 3, 6, 7, 9]])
    func multipleValidLevels(_ level: [Int]) async throws {
        #expect(PlantData.isLevelSafe(level) == true)
    }

    @Test("Levels", arguments: [[1, 2, 7, 8, 9],
                                [9, 7, 6, 2, 1],
                                [1, 3, 2, 4, 5],
                                [8, 6, 4, 4, 1]])
    func multipleInvalidLevels(_ level: [Int]) async throws {
        #expect(PlantData.isLevelSafe(level) == false)
    }
}
