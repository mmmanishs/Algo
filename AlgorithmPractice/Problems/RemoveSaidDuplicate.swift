//
//  RemoveSaidDuplicate.swift
//  AlgorithmPractice
//
//  Created by Manish Singh on 7/9/18.
//  Copyright © 2018 Manish Singh. All rights reserved.
//

import Foundation
class Problem8: Solvale {
    func startSolving() {
        var array = [1,1,2,2,5,5,6,9] // 6
        print(removeElement(&array, 5))
    }

    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        for (index, element) in nums.enumerated().reversed() {
            if element == val {
                nums.remove(at: index)
            }
        }
        return nums.count
    }
}
