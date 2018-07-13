//
//  RemoveDuplicatesFromArray.swift
//  AlgorithmPractice
//
//  Created by Manish Singh on 7/8/18.
//  Copyright © 2018 Manish Singh. All rights reserved.
//

import Foundation
class Problem7: Solvale {
    func startSolving() {
        var array = [1,1,2,2,5,5,6,9] // 5
        print(removeDuplicates(&array))
    }
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        for (index, num) in nums.enumerated().reversed() {
            print(num)
            if index > 0 {
                if num == nums[index - 1] {
                    nums.remove(at: index)
                }
            }
        }
        return nums.count
    }
}
