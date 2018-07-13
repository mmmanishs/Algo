//
//  SwapNodesPairs.swift
//  AlgorithmPractice
//
//  Created by Manish Singh on 7/11/18.
//  Copyright © 2018 Manish Singh. All rights reserved.
//

import Foundation
//Given 1->2->3->4, you should return the list as 2->1->4->3.
    //  2->1
class Problem12: Solvale {
    func startSolving() {
        
        let rootNode = ListNode.createList(values: [1,2,3,4])
//        ListNode.printList(rootNode)
        ListNode.printList(swapPairs(rootNode))
    }
    
    func swapPairs(_ head: ListNode?) -> ListNode? {
        guard head?.next != nil else {
            return head
        }
        var rootNode: ListNode?
        var isRootNodeRun = true
        var processingNode: ListNode?
        var previousNode: ListNode?
        processingNode = head
        while processingNode != nil {
            let nextNode = processingNode?.next
            if isRootNodeRun {
                isRootNodeRun = false
                rootNode = nextNode
            }
            let nextIterationNode = nextNode?.next
            let temp = processingNode
            processingNode = nextNode
            processingNode?.next = temp
            previousNode?.next = processingNode
            temp?.next = nextIterationNode
            previousNode = temp
            processingNode = nextIterationNode
        }
        return rootNode
    }
}
