//
//  Perimeter.swift
//  AlgorithmPractice
//
//  Created by Manish Singh on 7/21/18.
//  Copyright © 2018 Manish Singh. All rights reserved.
//

import Foundation

class Problem21: Solvale {
    func startSolving() {
//        let input = [[0,1,0,0],
//                     [1,1,1,0],
//                     [0,1,0,0],
//                     [1,1,0,0]]
        let input = [[1]]

        print(islandPerimeter(input))
    }
    
    func islandPerimeter(_ grid: [[Int]]) -> Int {
        //The grid[0] can be nil also so add check for that later
        guard grid.count > 0,
            grid[0].count > 0 else {
                return 0
        }
        let countI = grid[0].count
        let countJ = grid.count
        
        let gridSystem = GridSystem(lengthI: countI - 1, lengthJ: countJ - 1, grid: grid)
        var perimeter = 0
        for i in 0..<countI {
            for j in 0..<countJ {
                if grid[i][j] == 1 {
                    let sidePerimeter = gridSystem.getPerimeter(i: i, j: j)
                    perimeter += sidePerimeter
                    print(sidePerimeter)
                }
            }
        }
        return perimeter
    }
}

struct GridSystem {
    var lengthI: Int
    var lengthJ: Int
    var grid: [[Int]]
    
    func getPerimeter(i: Int, j: Int) -> Int {
        print("(\(i),\(j))")
        
        var perimeter = 0
        let check = getSidesCheck(i: i, j: j)
        if check.left {
            perimeter += getGridCoExists(i: i, j: j, side: .left)
        } else {
            perimeter += 1
        }
        if check.right {
            perimeter += getGridCoExists(i: i, j: j, side: .right)
        } else {
            perimeter += 1
        }
        if check.up {
            perimeter += getGridCoExists(i: i, j: j, side: .up)
        } else {
            perimeter += 1
        }
        if check.down {
            perimeter += getGridCoExists(i: i, j: j, side: .down)
        } else {
            perimeter += 1
        }
        return perimeter
    }
    
    func getSidesCheck(i: Int, j: Int) -> Check {
        let input = [[0,1,0,0],
                     [1,1,1,0],
                     [0,1,0,0],
                     [1,1,0,0]]
        switch (i, j) {
        case (lengthI, lengthJ): return Check(left: true, right: false, up: true, down: false)
        case (lengthI, 0): return Check(left: true, right: false, up: false, down: true)
        case (0, lengthJ): return Check(left: false, right: true, up: true, down: false)
        case (_, lengthJ): return Check(left: true, right: true, up: true, down: false)
        case (lengthI, _): return Check(left: true, right: false, up: true, down: true)
        case (0, _): return Check(left: false, right: true, up: true, down: true)
        case (_, 0): return Check(left: true, right: true, up: false, down: true)
        default: return Check(left: true, right: true, up: true, down: true)
        }
    }
    
    func getGridCoExists(i: Int, j: Int, side: Side) -> Int {
        switch side {
        case .left:
            return grid[i-1][j]
        case .right:
            return grid[i][j+1]
        case .up:
            return grid[i][j-1]
        case .down:
            return grid[i][j+1]
        }
    }
}

struct Check {
    let left: Bool
    let right: Bool
    let up: Bool
    let down: Bool
}

enum Side {
    case left
    case right
    case up
    case down
}
