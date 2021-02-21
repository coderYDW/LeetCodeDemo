//
//  MergeTwoLists.swift
//  LeetCodeDemo
//
//  Created by 杨冬武 on 2021/2/19.
//

import Foundation

/*
 将两个升序链表合并为一个新的 升序 链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。
 */

class MergeTwoLists {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil || l2 == nil {
            return l1 == nil ? l2 : l1
        }
        if l1!.val < l2!.val {
            l1?.next = mergeTwoLists(l1?.next, l2)
            return l1
        } else {
            l2?.next = mergeTwoLists(l2?.next, l1)
            return l2
        }
    }
    
    func mergeTwoLists10(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let dummy = ListNode(0)
        var temp: ListNode? = dummy, l1 = l1, l2 = l2
        while l1 != nil && l2 != nil {
            if l1!.val < l2!.val {
                temp?.next = l1
                l1 = l1?.next
            } else {
                temp?.next = l2
                l2 = l2?.next
            }
            temp = temp?.next
        }
        temp?.next = l1 == nil ? l2 : l1
        return dummy.next
    }
    
}
