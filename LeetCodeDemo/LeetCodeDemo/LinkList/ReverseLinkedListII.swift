//
//  ReverseLinkedListII.swift
//  LeetCodeDemo
//
//  Created by 杨冬武 on 2021/2/21.
//

import Foundation

/*
 反转从位置 m 到 n 的链表。请使用一趟扫描完成反转。
 说明:
 1 ≤ m ≤ n ≤ 链表长度。
 示例:
 输入: 1->2->3->4->5->NULL, m = 2, n = 4
 输出: 1->4->3->2->5->NULL
 */

class ReverseLinkedListII {
    
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        //a移动,b连接第一部分和第二部分,d为第2部分新建翻转链表的插入节点，e为连接第2部分和第3部分的节点
        var a = head, b = head, d: ListNode? = nil, e: ListNode? = nil
        let dummy = ListNode(0)
        for i in 1..<right + 1 {
            if i < left {
                b = a
                a = a?.next
            } else {
                let temp = dummy.next
                d = ListNode(a!.val)
                dummy.next = d
                if i == left {
                    e = d
                }
                dummy.next?.next = temp
                a = a?.next
            }
        }
        if left == 1 {
            e?.next = a
            return dummy.next
        }
        b?.next = dummy.next
        e?.next = a
        return head
    }
    
    func reverseBetween10(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        if head == nil { return head }
        var left = left, right = right
        var cur = head, pre: ListNode? = nil
        while left > 1 {
            pre = cur
            cur = cur?.next
            left -= 1
            right -= 1
        }
        
        let con = pre, tail = cur
        var third: ListNode? = nil
        while right > 0 {
            third = cur?.next
            cur?.next = pre
            pre = cur
            cur = third
            right -= 1
        }
        tail?.next = cur
        if con != nil {
            con?.next = pre
        } else {
            return pre
        }
        return head
    }
    
    
}
