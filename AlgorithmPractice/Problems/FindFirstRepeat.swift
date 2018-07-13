//
//  FindFirstRepeat.swift
//  AlgorithmPractice
//
//  Created by Manish Singh on 7/10/18.
//  Copyright © 2018 Manish Singh. All rights reserved.
//

import Foundation
class Problem10: Solvale {
    func startSolving() {
        var array = [1, 0, -1, 0, -2, 2] // 3
        print(findFirstRepeat("Amazon.com"))
    }
    
    func findFirstRepeat(_ inputString: String) -> Character? {
        var isFirstNonRepeatingChar = true
        var noOfTimesFound = 0
        for char in inputString.lowercased() {
            isFirstNonRepeatingChar = true
            noOfTimesFound = 0
            for scannedChar in inputString.lowercased() {
                print("\(char) == \(scannedChar)")
                if char == scannedChar {
                    noOfTimesFound += 1
                    if noOfTimesFound > 1 {
                        isFirstNonRepeatingChar = false
                        break
                    }
                }
            }
            if isFirstNonRepeatingChar {
                return char
            }
        }
        return nil
    }
}
