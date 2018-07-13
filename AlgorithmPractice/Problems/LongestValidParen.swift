//
//  LongestValidParen.swift
//  AlgorithmPractice
//
//  Created by Manish Singh on 7/12/18.
//  Copyright © 2018 Manish Singh. All rights reserved.
//
/*
 Input: "(()"
 Output: 2
 Explanation: The longest valid parentheses substring is "()"
 
 32. Longest Valid Parentheses

 */
import Foundation

class Problem13: Solvale {
    func startSolving() {
        print(longestValidParentheses("()(()"))
    }
    
    func longestValidParentheses(_ s: String) -> Int {
        var stack = [Character]()
        for char in s {
            
            if String(char) == "(" {
                stack.append(char)
            } else if String(char) == ")" {
                guard stack.count >= 1 else {
                    stack.append(char)
                    continue
                }
                if String(stack.last!) == "(" {
                    stack.removeLast()
                } else {
                    stack.append(char)
                }
            }
        }
        return (s.count - stack.count) / 2
    }
}
