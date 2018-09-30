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
        let a = "asfesa"
    }
    
    func longestValidParentheses(_ s: String) -> Int {
        guard s != "",
            s.count != 0 else {
                return 0
        }
        
        var longest = 0
        var current = 0
        var sinceLastClose = 0
        var stack = [Character]()
        for char in s {
            print(stack)
            print(char)
            
            if isPatternBroken(stack: stack, char: char) {
                if current > longest {
                    longest = current
                }
                current = 0
            }
            if stackCanPop(stack: stack, char: char) {
                stack.removeLast()
                current += 2
                sinceLastClose += 2
            } else {
                stack.append(char)
            }
        }
        if current > longest {
            longest = current
        }
        return longest
    }
    
    func stackCanPop(stack: [Character], char: Character) -> Bool {
        //check if ) is in char and we have a last char in the stack as (
        guard stack.count > 0 else {
            return false
        }
        return (String(stack.last!) == "(") && (String(char) == ")")
    }
    
    func isPatternBroken(stack: [Character], char: Character) -> Bool {
        if  stack.count == 0 && String(char) == ")" {
            return true
        }
        if  stack.count == 0 && String(char) == "(" {
            return false
        }
        // here can forcefully unwrap
        return String(stack.last!) == ")" && (String(char) == ")")
    }
}
