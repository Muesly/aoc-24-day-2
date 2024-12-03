//
//  main.swift
//  Day2
//
//  Created by Short, Tony (T.) on 03/12/2024.
//

import Foundation

print("Testing nuclear reactor data...")

guard CommandLine.arguments.count > 1 else {
    print("Please supply file path")
    exit(1)
}
report(filePath: CommandLine.arguments[1])

func report(filePath: String) {
    guard let data = try? String(contentsOfFile: filePath, encoding: .utf8) else {
        return
    }

    var successfulLevels = 0
    data.enumerateLines(invoking: { line, _ in
        let level = line.components(separatedBy: " ").map { Int($0) ?? 0 }
        if PlantData.isLevelSafe(level) {
            successfulLevels += 1
        }
    })
    print("There were \(successfulLevels) successful levels")
}
