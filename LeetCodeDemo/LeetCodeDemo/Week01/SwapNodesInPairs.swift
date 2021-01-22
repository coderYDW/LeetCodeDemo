//
//  SwapNodesInPairs.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2021/1/22.
//

import Foundation

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */

class SwapNodesInPairs {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        let dummyHead = ListNode(0)
        dummyHead.next = head
        var temp: ListNode? = dummyHead
        while temp?.next != nil && temp?.next?.next != nil {
            let node1 = temp?.next;
            let node2 = temp?.next?.next
            temp?.next = node2
            node1?.next = node2?.next
            node2?.next = node1
            temp = node1
        }
        return dummyHead.next
    }
    
    func swapPairs10(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        let temp = head?.next
        head?.next = swapPairs(temp?.next)
        temp?.next = head
        return temp
    }
    
}
