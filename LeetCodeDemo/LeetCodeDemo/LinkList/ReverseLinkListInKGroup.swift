//
//  ReverseLinkListInKGroup.swift
//  LeetCodeDemo
//
//  Created by Apple on 2021/3/2.
//

import Foundation

class ReverseLinkListInKGroup {
    
    func reverseKGroup20(_ head: ListNode?, _ k: Int) -> ListNode? {
        let dummy = ListNode(0, head)       //作为头结点
        var prev: ListNode? = dummy         //标记每一个翻转区间上一个结点
        var head = head, tail = prev        //标记翻转区间的结点 头和尾
        // 循环条件：头结点不为空
        while head != nil {
            //找到tail 的 k 个位置
            for _ in 0..<k {
                tail = tail?.next
                //如果剩余不够 k 个，不需要处理了
                if tail == nil {
                    return dummy.next
                }
            }
            //翻转 head 到 tail
            for _ in 1..<k {
                let cur = prev?.next
                prev?.next = cur?.next
                cur?.next = tail?.next
                tail?.next = cur
            }
            //重置 prev、tail 和 head 值，以便进行下一次 k 区间翻转
            prev = head
            tail = head
            head = head?.next
        }
        return dummy.next
    }
    
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
    
    
    func reverseKGroupi10(_ head: ListNode?, _ k: Int) -> ListNode? {
        let dummy = ListNode(0, head)       //作为头结点
        var head = head, tail: ListNode?    //标记翻转区间的结点 头和尾
        var prev: ListNode? = dummy         //标记每一个翻转区间上一个结点
        var temp: ListNode?                 //标记每一个翻转区间下一个结点
        while head != nil {
            //找到tail 的 k 个位置
            tail = prev
            for _ in 0..<k {
                tail = tail?.next
                //如果剩余不够 k 个，不需要处理了
                if tail == nil {
                    return dummy.next
                }
            }
            //翻转 head 到 tail，类似“翻转链表题”
            temp = tail?.next
            var rPrev = tail?.next, rCur = head, rTemp: ListNode?
            while rPrev !== tail {
                rTemp = rCur?.next
                rCur?.next = rPrev
                rPrev = rCur
                rCur = rTemp
            }
            //翻转后交换下 head 和 tail 指向
            swap(&head, &tail)
            //翻转后接回原链表
            prev?.next = head
            tail?.next = temp
            //重置 prev 和 head 值，以便进行下一次 k 区间翻转
            prev = tail
            head = tail?.next
        }
        return dummy.next
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
