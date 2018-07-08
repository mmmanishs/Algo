//
//  Problem4.swift
//  AlgorithmPractice
//
//  Created by Manish Singh on 7/7/18.
//  Copyright © 2018 Manish Singh. All rights reserved.
//

import Foundation

class Problem4: Solvale {
    func makeNodes1() -> ListNode {
        let n1 = ListNode(1)
//        let n2 = ListNode(2)
//        n1.next = n2
        return n1
    }
    
    func makeNodes2() -> ListNode {
        let p1 = ListNode(2)
//        let p2 = ListNode(3)
//        let p3 = ListNode(4)
//        p1.next = p2
//        p2.next = p3
        return p1
    }
    
    
    func startSolving() {
        let l1 = makeNodes1()
        let l2 = makeNodes2()
        
        var n1 = mergeTwoLists(l1, l2)
        
       ListNode.printList(n1)
        
    }

    
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard let l1 = l1 else {
            return l2
        }
        guard let l2 = l2 else {
            return l1
        }
        var isFirstNode = true
        var mergedStartingNode: ListNode?
        var node1: ListNode? = l1
        var prevNode1: ListNode?
        var node2: ListNode? = l2
        
        while (node1 != nil) && (node2 != nil) {
            if node1!.val < node2!.val {
                prevNode1 = node1
                node1 = node1?.next
                if node1 == nil {
                    prevNode1?.next = node2
                }
                if isFirstNode {
                    mergedStartingNode = prevNode1
                    isFirstNode = !isFirstNode
                }
            } else {
                if isFirstNode {
                    mergedStartingNode = node2
                    isFirstNode = !isFirstNode
                }
                let tempNode = node2?.next
                prevNode1?.next = node2
                node2?.next = node1
                prevNode1 = node2
                node2 = tempNode

            }
        }
        return mergedStartingNode
    }
}

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    static func createList(values: [Int]) -> ListNode? {
        var rootNode: ListNode?
        var prevNode: ListNode?
        var isFirstNode = true
        
        for value in values {
            let node = ListNode(value)
            prevNode?.next = node
            prevNode = node
            if isFirstNode {
                isFirstNode = !isFirstNode
                rootNode = node
            }
        }
        return rootNode
    }
    
    static func printList(_ l: ListNode?) {
        var n1 = l
        var output = ""
        while n1 != nil {
            output += "\(n1?.val) --> "
            n1 = n1?.next
        }
        print(output)
    }
    
    static func printList(_ list: [ListNode?]) {
        var output = "["
        for n1 in list {
            output += "\(n1?.val), "
        }
         output += "]"
        print(output)
    }
}
