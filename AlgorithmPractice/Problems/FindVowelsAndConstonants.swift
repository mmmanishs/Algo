//
//  FindVowelsAndConstonants.swift
//  AlgorithmPractice
//
//  Created by Manish Singh on 7/20/18.
//  Copyright © 2018 Manish Singh. All rights reserved.
//

import Foundation
class Problem18: Solvale {
    func startSolving() {
        let inputString = "A quick brown fox jumped over a lazy little dog"
        let results = getResults(inputString)
        print("Vowels = \(results.numberOfVowels)")
        print("Constonants = \(results.numberOfConstonants)")
    }
    
    func getResults(_ str: String) -> FVCResults {
        var vow: UInt = 0
        var con: UInt = 0
        let vowCharset = CharacterSet(charactersIn: "aeiou")
        let consCharset = CharacterSet(charactersIn: "bcdfghjklmnopqrstwxyz")
        for char in str.lowercased().unicodeScalars {
            if vowCharset.contains(char) {
                vow += 1
            } else if consCharset.contains(char) {
                con += 1
            }
        }
        return FVCResults(numberOfVowels: vow, numberOfConstonants: con)
    }
}

struct FVCResults {
    let numberOfVowels: UInt
    let numberOfConstonants: UInt
}
