//
//  ReverseList.swift
//  AlgorithmPractice
//
//  Created by Manish Singh on 7/30/18.
//  Copyright © 2018 Manish Singh. All rights reserved.
//

import Foundation

class ReverseList: Solvale {
    func startSolving() {
        let a = ListNode.createList(values: [1,2,3,4,5])
        print(ListNode.printList(a))

        let b = reverseList(a)
        print(ListNode.printList(b))
    }

    func reverseList(_ head: ListNode?) -> ListNode? {
        return reverse(head?.next, head)
    }
    
    func reverse(_ node: ListNode?, _ prevNode: ListNode?) -> ListNode? {
        if node == nil {
            return prevNode
        }
        let nextNode = node?.next
        node?.next = prevNode
        if nextNode == nil {
            print(node?.val)
            return node
        }
        return reverse(nextNode, node)
    }
}
