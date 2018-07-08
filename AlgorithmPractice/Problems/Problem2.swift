//
//  Solution2.swift
//  AlgorithmPractice
//
//  Created by Manish Singh on 7/7/18.
//  Copyright © 2018 Manish Singh. All rights reserved.
//

import Foundation

//Given a 32-bit signed integer, reverse digits of an integer.

class Problem2: Solvale {
    func startSolving() {
        let integer = -1231515163456
        print("Integer: \(integer)")
        print("Reversed: \(getReversed(x: integer))")
    }
    
    func getReversed(x: Int) -> Int {
        var processingNumber = x
        var divisor = 10
        var outputInteger = 0
        while processingNumber != 0 {
            outputInteger *= 10
            let digit = processingNumber % divisor
            processingNumber /= divisor
            outputInteger += digit
            if abs(outputInteger) > Int32.max {
                return 0
            }
        }
        return outputInteger
    }

}
