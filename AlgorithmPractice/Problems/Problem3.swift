//
//  Problem3.swift
//  AlgorithmPractice
//
//  Created by Manish Singh on 7/7/18.
//  Copyright © 2018 Manish Singh. All rights reserved.
//

import Foundation

class Problem3: Solvale {
    func startSolving() {
        let string = "qwerttrewq"
        print("result 3")
        print(longestPalindrome(string))
        
    }
    
    func longestPalindrome(_ s: String) -> String {
        var largestPalindrome = ""
        var start = 0
        var end = s.count
        var lengthOfLongest = 0
        while (s.count - start) > lengthOfLongest {
            var subString = s.getSubstring(start: start, end: end)
            
        }
        return largestPalindrome
    }
    
    func iSPalindrome(_ s: String) -> Bool {
        let len = s.count
        for (index, c) in s.enumerated() {
            if !(c == s[len - 1 - index]) {
                return false
            }
            if index > len / 2 {
                break
            }
        }
        return true
    }
}

extension String {
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
    
    func getSubstring(start: Int, end: Int) -> String {
        let start = index(startIndex, offsetBy: start)
        let end = index(startIndex, offsetBy: end)
        let range = start...end
        return String(self[range])
    }
}
