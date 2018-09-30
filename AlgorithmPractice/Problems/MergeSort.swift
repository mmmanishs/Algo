//
//  MergeSort.swift
//  AlgorithmPractice
//
//  Created by Manish Singh on 7/13/18.
//  Copyright © 2018 Manish Singh. All rights reserved.
//

import Foundation

class Problem14: Solvale {
    func startSolving() {
        var nums = [6,4,5,9,12,3,7]
//        print(nums)
//        mergeSort(&nums, low: 0, high: nums.count - 1)
//        print(nums)
        var a = [0,1,2,3,4,5,6,7,8,9]
        let b = [[Int]]()
        howItLoops(nums: &a)
        print(a)
    }
    
    func howItLoops(nums: inout [Int]) {
        var j = nums.count - 1
        for i in 1..<nums.count {
            (nums[i], nums[j]) = (nums[j], nums[i])
            j -= 1
        }
        print(nums)
    }
    func mergeSort(_ nums: inout [Int], low: Int, high: Int) {
        if low < high {
            let median = (low + high) / 2
            mergeSort(&nums, low: low, high: median)
            mergeSort(&nums, low: (median + 1), high: high)
            let a = Array<Int>(nums[low...median])
            let b = Array<Int>(nums[(median + 1)...high])
            let mergedArray = merge(a:a, b: b)
            nums[low...high] = mergedArray[0..<mergedArray.count]
        }
    }
    
    func merge(a: [Int], b: [Int]) -> [Int] {
        var i = 0
        var j = 0
        var newArray = [Int]()
        while i < a.count && j < b.count {
            if a[i] < b[j] {
                newArray.append(a[i])
                i += 1
            } else{
                newArray.append(b[j])
                j += 1
            }
        }
        if i < a.count {
          newArray.append(contentsOf: Array<Int>(a[i..<a.count]))
        } else if j < b.count {
            newArray.append(contentsOf: Array<Int>(b[j..<b.count]))
        }
        return newArray
    }
}
