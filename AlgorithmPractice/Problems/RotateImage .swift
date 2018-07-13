//
//  RotateImage .swift
//  AlgorithmPractice
//
//  Created by Manish Singh on 7/11/18.
//  Copyright © 2018 Manish Singh. All rights reserved.
//

import Foundation

class Problem11: Solvale {
    func startSolving() {
        var array = [
            [ 5, 1, 9,11],
            [ 2, 4, 8,10],
            [13, 3, 6, 7],
            [15,14,12,16]
        ] // 3
        print(rotate(&array))
    }
func rotate(_ matrix: inout [[Int]]) {
    let sideSize = matrix.count - 1
    var tempMat = [[Int]](repeating: [Int](repeating: 0, count: sideSize + 1), count: sideSize + 1)
    for (index, vector) in matrix.enumerated() {
        for (elementIndex,element) in vector.enumerated() {
            tempMat[index][sideSize - index] = element
        }
    }
    matrix = tempMat
}
}
