//
//  AllPotentialSubset.swift
//  AlgorithmPractice
//
//  Created by Manish Singh on 7/21/18.
//  Copyright © 2018 Manish Singh. All rights reserved.
//

import Foundation
class Problem22: Solvale {
    func startSolving() {
        var input = [0,0,0,5,3,9,4,0,2,0,6]
        print(input)
        print(sort(input: &input))
        print(input)
    }
    
    func sort(input: inout [Int]) -> Int {
        var count = 0
        for (index, element) in input.enumerated() {
            if element == 0 {
                input.remove(at: index)
                input.insert(element, at: 0)
                count += 1
            }
        }
        return count
    }
}

enum Optional<T> {
    case empty, value
}
