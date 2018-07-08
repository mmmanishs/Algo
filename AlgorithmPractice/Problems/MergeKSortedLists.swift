//
//  MergeKSortedLists.swift
//  AlgorithmPractice
//
//  Created by Manish Singh on 7/8/18.
//  Copyright © 2018 Manish Singh. All rights reserved.
//

import Foundation
class Problem6: Solvale {
    func startSolving() {
        let arrayInput = inputForMultimerge
//        let n1 = ListNode.createList(values: [-8,-7,-7,-5,1,1,3,4])
//        let n2 = ListNode.createList(values: [-2])
//        let n3 = ListNode.createList(values: [-10,-10,-7,0,1,3])
//        let n4 = ListNode.createList(values: [2])
        var inputLists = [ListNode?]()
        for input in arrayInput {
            inputLists.append(ListNode.createList(values: input))
        }
        ListNode.printList(mergeKLists(inputLists))
    }
    
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var rootNode: ListNode?
        var lastNodeOfLoop: ListNode?
        var isRootNodeLoop = true
        var areAllNodesNil = false
        var toBeScannedNodes = lists
        var previousScannedNodes = toBeScannedNodes
        while !areAllNodesNil {
     
            let isSmallerList = findSmallestNodes(toBeScannedNodes)
            print(isSmallerList.flatMap({return $0}))
            previousScannedNodes = toBeScannedNodes
            toBeScannedNodes = crawlNodes(toBeScannedNodes, isSmallerList: isSmallerList)
            print("To be chainned nodes\n")
            ListNode.printList(previousScannedNodes)
            print("=====")
            print("Crawled nodes\n")
            ListNode.printList(toBeScannedNodes)
            print("=====")
            let nodeTuple = chainTogether(previousScannedNodes, isSmallerList: isSmallerList)
            lastNodeOfLoop?.next = nodeTuple.0
            lastNodeOfLoop = nodeTuple.1
            if isRootNodeLoop {
                isRootNodeLoop = false
                rootNode = nodeTuple.0
            }
            print("Current sorted nodes\n")
            ListNode.printList(rootNode)
            print("=====")
            areAllNodesNil = toBeScannedNodes.filter {node in
                return node != nil
                }.count == 0
            
        }
        
        return rootNode
    }
    
    func chainTogether(_ lists: [ListNode?], isSmallerList: [Bool]) -> (ListNode?, ListNode?) {
        var rootNode: ListNode?
        var lastNode: ListNode?
        var prevNode: ListNode?
        var canAddRootNode = true
        for (index,node) in lists.enumerated() {
            if isSmallerList[index] == false {
                continue
            }
            prevNode?.next = node
            prevNode = node
            if canAddRootNode && node != nil {
                rootNode = node
                canAddRootNode = !canAddRootNode
            }
            if node != nil {
                lastNode = node
            }
        }
        prevNode?.next = nil
        return (rootNode, lastNode)
    }
    
    func crawlNodes(_ lists: [ListNode?], isSmallerList: [Bool]) -> [ListNode?] {
        var nodes = lists
        for (index, isSmall) in isSmallerList.enumerated() {
            if isSmall {
                nodes[index] = nodes[index]?.next
            }
        }
        return nodes
    }
    
    func findSmallestNodes(_ lists: [ListNode?]) -> [Bool] {
        ListNode.printList(lists)

        var isSmallerList: [Bool] = Array(repeatElement(true, count: lists.count))
        for (index, node) in lists.enumerated() {
            for n1 in lists {
                guard let node = node else {
                    isSmallerList[index] = false
                    break
                }
                guard let n1 = n1 else {
                    continue
                }
                if node.val > n1.val {
                    isSmallerList[index] = false
                }
            }
        }
        return isSmallerList
    }
    
}

