//
//  ReverseLinkedList.swift
//  LeetCodeDemo
//
//  Created by 杨冬武 on 2021/2/6.
//

import Foundation
/*
 反转一个单链表。

 示例:

 输入: 1->2->3->4->5->NULL
 输出: 5->4->3->2->1->NULL

 进阶:
 你可以迭代或递归地反转链表。你能否用两种方法解决这道题？

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/reverse-linked-list
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class ReverseLinkedList {
    //迭代
    func reverseList10(_ head: ListNode?) -> ListNode? {
        var pre: ListNode? = nil, cur = head
        while cur != nil {
            let next = cur?.next
            cur?.next = pre
            pre = cur
            cur = next
        }
        return pre
    }
    //递归
    func reverseList(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        let newHead = reverseList(head?.next)
        head?.next?.next = head
        head?.next = nil
        return newHead
    }
}
