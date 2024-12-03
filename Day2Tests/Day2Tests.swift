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

    enum Direction {
        case flat
        case increasing
        case decreasing
    }

    private func isLevelSafe(_ level: [Int]) -> Bool {
        guard level.count > 1 else {
            return true
        }

        var direction: Direction?

        for i in 1..<level.count {
            let newDirection: Direction
            if level[i] > level[i-1] {
                newDirection = .increasing
            } else if level[i] < level[i-1] {
                newDirection = .decreasing
            } else {
                newDirection = .flat
            }

            if let direction,
               newDirection != direction {
                return false
            }
            direction = newDirection
        }
        return true
    }
}
