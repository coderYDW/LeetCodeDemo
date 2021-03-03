//
//  ReverseLinkListInKGroup.swift
//  LeetCodeDemo
//
//  Created by Apple on 2021/3/2.
//

import Foundation

class ReverseLinkListInKGroup {
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        var head = head
        let hair = ListNode()
        hair.next = head
        var pre = hair
        while head != nil {
            var tail: ListNode? = pre
            for _ in 0..<k {
                tail = tail?.next
                if tail == nil {
                    return hair.next
                }
            }
            let nex = tail?.next
            let reverse = myReverse(head!, tail!)
            head = reverse.first!
            tail = reverse.last!
            pre.next = head
            tail?.next = nex
            pre = tail!
            head = tail?.next
        }
        return hair.next
    }
    
    func myReverse(_ head: ListNode, _ tail: ListNode) -> [ListNode] {
        var prev = tail.next
        var p = head
        while prev !== tail {
            let nex = p.next!
            p.next = prev
            prev = p
            p = nex
        }
        return [tail, head]
    }
}
