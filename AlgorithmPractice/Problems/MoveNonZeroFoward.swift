//
//  MoveNonZeroFoward.swift
//  AlgorithmPractice
//
//  Created by Manish Singh on 7/20/18.
//  Copyright © 2018 Manish Singh. All rights reserved.
//

import Foundation
class Problem19: Solvale {
    func startSolving() {
        var array = [ 1, 0, 2, 0, 0, 3, 4,0,0,0,0,0 ]
        print(array)
        print("\n\nResult...")
        print("No of zeros: \(solve(&array))")
        print(array)

    }
    
    
    func solve(_ array: inout [Int]) -> UInt {
        var count: UInt = 0
        for (index, element) in array.enumerated() {
            if element == 0 {
                count += 1
            }
        }
        return count
    }
}
