//
//  PlantData.swift
//  Day2
//
//  Created by Short, Tony (T.) on 03/12/2024.
//

import Foundation

struct PlantData {
    enum Direction {
        case flat
        case increasing
        case decreasing
    }

    static func isLevelSafe(_ level: [Int]) -> Bool {
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
