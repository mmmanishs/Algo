//
//  IndexOfElement.swift
//  AlgorithmPractice
//
//  Created by Manish Singh on 7/16/18.
//  Copyright © 2018 Manish Singh. All rights reserved.
//

import Foundation

class Problem17: Solvale {
    func startSolving() {

        let str = "This is goodbye"
        print(str.split(separator: " "))
        var a = [String:Int]()
        a["a"] = 1
        a["g"] = 23
        a["d"] = 9
        let b = a.max { i, j in
            i.value < j.value
        }
        
        print(b)
        print(shortestToChar("loveleetcode", "e"))
    }
    
    func shortestToChar(_ S: String, _ C: Character) -> [Int] {
        var vector = [Int](repeating: -1, count: S.count)
        var indexOfC = [Int]()
        for (index, char) in S.enumerated() {
            if char == C {
                indexOfC.append(index)
            }
        }
        if indexOfC.count == 0 {
            return vector
        }
        var k = 0
        
        for (index, char) in S.enumerated() {
            print(char)
            if char == C {
                vector[index] = 0
                continue
            }
            vector[index] = abs(index - getPivotElement(i: index, indexOfC: indexOfC))
        }
        return vector
    }
    
    func getPivotElement(i: Int, indexOfC: [Int]) -> Int {
        guard indexOfC.count > 0 else {
            return -1
        }
        for (index, element) in indexOfC.enumerated() {
            if i < element {
                if index == 0 {
                    return element
                } else {
                    let low = indexOfC[index - 1]
                    let high = indexOfC[index]
                    let pivot = (low + high) / 2
                    if i <= pivot {
                        return indexOfC[index - 1]
                    } else {
                        indexOfC[index]
                    }
                }
            }
        }
        return indexOfC.last!
    }
}
