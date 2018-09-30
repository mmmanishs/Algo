//
//  Audible.swift
//  AlgorithmPractice
//
//  Created by Manish Singh on 7/15/18.
//  Copyright © 2018 Manish Singh. All rights reserved.
//

// Find the first repeating character in Amazon.com
import Foundation
class Problem15: Solvale {
    func startSolving() {
        print("Position : \(findPositionOfRepeatingCharacter(input: "Amazon.com"))")
    }
    
    func findPositionOfRepeatingCharacter(input: String) -> String {
        var alreadyScanned = [Character: Bool]()
        
        for char in input.lowercased() {
            if alreadyScanned[char] != nil {
                alreadyScanned[char] = true
            } else {
                alreadyScanned[char] = false
            }
        }

        for char in input.lowercased() {
            if alreadyScanned[char] == false {
                return String(char)
            }
        }
        return ""
    }
}
