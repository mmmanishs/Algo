//
//  PalindromeNUmber.swift
//  AlgorithmPractice
//
//  Created by Manish Singh on 7/8/18.
//  Copyright © 2018 Manish Singh. All rights reserved.
//

import Foundation


class Problem5: Solvale {
    func startSolving() {
        if isPalindrome(0) {
            print("Is a palindrome")
        } else {
            print("Is not")
        }
    }
    
    func isPalindrome(_ x: Int) -> Bool {
        guard x >= 0 else {
            return false
        }
        var num = x
        var newNum = 0
        while num > 0 {
            newNum *= 10
            newNum += num % 10
            num /= 10
        }
        return newNum == x
    }
}
