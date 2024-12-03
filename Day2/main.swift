//
//  main.swift
//  Day2
//
//  Created by Short, Tony (T.) on 03/12/2024.
//

import Foundation

guard CommandLine.arguments.count > 1 else {
    print("Please supply file path")
    exit(1)
}

print("Analysing nuclear plant data...")
guard let data = try? String(contentsOfFile: CommandLine.arguments[1], encoding: .utf8) else {
    print("Failed to read input data")
    exit(1)
}

var successfulLevels = 0
data.enumerateLines(invoking: { line, _ in
    let level = line.components(separatedBy: " ").map { report in
        guard let reportNum = Int(report) else {
            print("Invalid report \(report)")
            exit(1)
        }
        return reportNum
    }
    if PlantData.isLevelSafe(level) {
        successfulLevels += 1
    }
})
print("There were \(successfulLevels) successful levels")
