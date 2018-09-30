//
//  BinaryTree.swift
//  AlgorithmPractice
//
//  Created by Manish Singh on 7/9/18.
//  Copyright © 2018 Manish Singh. All rights reserved.
//

import Foundation

class Node {
    var left: Node?
    var right: Node?
    var val: Int
    init(_ value: Int) {
        val = value
    }
    
    static func createBinarySearchTree(values: [Int]) -> Node? {
        guard values.count != 0 else {
            return nil
        }
        let rootNode = Node(values[0])
        var currentNode = rootNode
        for i in 1..<values.count {
           let node = Node(values[i])
            if values[i] > currentNode.val {
                currentNode.right = node
            } else {
                currentNode.left = node
            }
            currentNode = node
        }
        return rootNode
    }
}

