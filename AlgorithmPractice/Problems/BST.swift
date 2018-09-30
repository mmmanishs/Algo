//
//  BST.swift
//  AlgorithmPractice
//
//  Created by Manish Singh on 7/25/18.
//  Copyright © 2018 Manish Singh. All rights reserved.
//

// AVL tree. Balance a tree
import Foundation
class BST: Solvale {
    func startSolving() {
        var values = [5,1,2,1,4,5,7]
        let rootNode = Node.createBinarySearchTree(values: values)
        preOrderTraverse(node: rootNode)
    }
    
    func preOrderTraverse(node: Node?) {
        if node?.left != nil {
            preOrderTraverse(node: node?.left)
        } else if node?.right != nil {
            preOrderTraverse(node: node?.right)
        }
        print(node?.val)
    }
}
