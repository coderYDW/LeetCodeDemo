//
//  ReverseLinkListInKGroup.swift
//  LeetCodeDemo
//
//  Created by Apple on 2021/3/2.
//

import Foundation

class ReverseLinkListInKGroup {
    
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        let dummy = ListNode(0, head)
        var prev: ListNode? = dummy, start = head, end: ListNode?, temp: ListNode?
        while start != nil {
            end = prev
            for _ in 0..<k {
                end = end?.next
                if end == nil {
                    return dummy.next
                }
            }
            temp = end?.next
            let res = reverse(start, end)
            start = res.start
            end = res.end
            prev?.next = start
            end?.next = temp
            prev = end
            start = temp
        }
        return dummy.next
    }
    func reverse(_ start: ListNode?, _ end: ListNode?) -> (start: ListNode?, end: ListNode?) {
        var prev = end?.next, cur = start, temp: ListNode?
        while prev !== end {
            temp = cur?.next
            cur?.next = prev
            prev = cur
            cur = temp
        }
        return (end, start)
    }
    
    func test() {
        let head = ListNode(1)
        var node = head
        for i in 2..<6 {
            let temp = ListNode(i)
            node.next = temp
            node = temp
        }
        let new = reverseKGroup(head, 2)
        print("end")
    }
}
