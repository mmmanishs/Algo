//
//  Prime.swift
//  AlgorithmPractice
//
//  Created by Manish Singh on 7/28/18.
//  Copyright © 2018 Manish Singh. All rights reserved.
//

import Foundation

class Prime: Solvale {
    func startSolving() {
        print(countPrimes(10000))
    }
    
    func countPrimes(_ n: Int) -> Int {
        if n <= 2 {
            return 0
        }
        var primes = [2]
        for i in 2..<n {
            if isPrime(i, primes: primes) {
                primes.append(i)
                print(i)
            }
        }
        return primes.count
    }
    
    func isPrime(_ n: Int, primes: [Int]) -> Bool {
        if primes.contains(n) {
            return false
        }
        var multiple = 1
        for prime in primes {
            multiple = 2 * prime
            if n % prime == 0 {
                return false
            }
            if multiple > n {
                return true
            }
        }
        return true
    }
}

class Solution {
    func countPrimes(_ n: Int) -> Int {
        if n <= 2 {
            return 0
        }
        var primes = [2]
        for i in 2..<n {
            if isPrime(i, primes: primes) {
                primes.append(i)
            }
        }
        return primes.count
    }
    
    func isPrime(_ n: Int, primes: [Int]) -> Bool {
        if primes.contains(n) {
            return false
        }
        var multiple = 1
        for prime in primes {
            multiple *= prime
            if n % prime == 0 {
                return false
            }
            if multiple > n {
                return true
            }
        }
        return true
    }
}



