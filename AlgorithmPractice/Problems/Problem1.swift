//
//  FindIfStringContainsClosedBrackets.swift
//  AlgorithmPractice
//
//  Created by Manish Singh on 7/7/18.
//  Copyright © 2018 Manish Singh. All rights reserved.
//

import Foundation

class Problem1: Solvale {
    func findIfStringContainsClosedBrackets(inputString: String) -> Bool {
        var stack = [Character]()
        for c in inputString {
            if c == "(" {
                stack.append(c)
            } else if c == ")" {
                if stack.last == "(" {
                    stack.removeLast()
                } else {
                    return false
                }
            }
        }
        return stack.count == 0
    }
    
    func startSolving() {
        if findIfStringContainsClosedBrackets(inputString: "((()((((())))))") {
            print("Yes it is")
        } else {
            print("No its not")
        }
    }

}

