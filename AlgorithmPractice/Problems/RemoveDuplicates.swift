//
//  RemoveDuplicates.swift
//  AlgorithmPractice
//
//  Created by Manish Singh on 7/20/18.
//  Copyright © 2018 Manish Singh. All rights reserved.
//

import Foundation
class Problem20: Solvale {
    func startSolving() {
        let inputString = "A quick brown fox jumped over a lazy little dog"
        print(inputString)
        print(removeDuplicates(inputString))
    }
    
    func removeDuplicates(_ str: String) -> String {
        var dict = [Character : Int]()
        for char in str {
            if let element = dict[char] {
                dict[char] = element + 1
            } else {
                dict[char] = 1
            }
        }
        
        let leftOvers = dict.filter { element in
            return element.value == 1
        }
        let arrayLeftOvers = Array<Character>(leftOvers.keys)
        return String(arrayLeftOvers)
    }
}
