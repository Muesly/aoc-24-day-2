//
//  Day2Tests.swift
//  Day2Tests
//
//  Created by Short, Tony (T.) on 03/12/2024.
//

import Testing

struct Day2Tests {

    @Test func singleLevel() {
        let level = [7,6,4,2,1]
        #expect(isLevelSafe(level) == true)
    }

    @Test("Levels", arguments: [[7, 6, 4, 2, 1],
                                [1, 3, 6, 7, 9]])
    func multipleValidLevels(_ level: [Int]) async throws {
        #expect(isLevelSafe(level) == true)
    }

    @Test("Levels", arguments: [[1, 2, 7, 8, 9],
                                [9, 7, 6, 2, 1],
                                [1, 3, 2, 4, 5],
                                [8, 6, 4, 4, 1]])
    func multipleInvalidLevels(_ level: [Int]) async throws {
        #expect(isLevelSafe(level) == false)
    }

    enum Direction {
        case flat
        case increasing
        case decreasing
    }

    private func isLevelSafe(_ level: [Int]) -> Bool {
        let upperMovementLimit: Int = 3

        guard level.count > 1 else {
            return true
        }

        var direction: Direction?

        for i in 1..<level.count {
            let newDirection: Direction
            let nextReport = level[i]
            let prevReport = level[i-1]

            if nextReport > prevReport {
                newDirection = .increasing
            } else if nextReport < prevReport {
                newDirection = .decreasing
            } else {
                if direction == .flat {
                    // Cannot have continuous flat readings
                    return false
                }
                newDirection = .flat
            }

            if abs(nextReport - prevReport) > upperMovementLimit {
                // Cannot be going up or down too much
                return false
            }

            if let direction,
               newDirection != direction {
                // Cannot change direction
                return false
            }
            direction = newDirection
        }
        return true
    }
}
