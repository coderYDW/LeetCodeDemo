//
//  ReversePrint.swift
//  LeetCodeDemo
//
//  Created by Apple on 2020/12/17.
//

import Foundation

class ReversePrint {
    // MARK: 递归
    
    /*
     - 时间复杂度：O(n)，其中 n 为链表节点的个数。链表的遍历中每个节点会被访问一次且只会被访问一次。
     - 空间复杂度：O(n)。空间复杂度取决于递归的栈深度，而栈深度为一条链的情况下会达到 O(n) 的级别。
     */
    func reversePrint(_ head: ListNode?) -> [Int] {
        var res = [Int]()
        reverse(head, &res)
        return res
    }
    func reverse(_ head: ListNode?, _ res: inout [Int]) {
        if head == nil {
            return
        }
        reverse(head!.next, &res)
        res.append(head!.val)
    }
    
    // MARK: 栈
    
    /*
     - 时间复杂度：O(n)，其中 n 为链表节点的个数。链表的遍历中每个节点会被访问二次，入栈一次出栈一次。
     - 空间复杂度：O(n)。空间复杂度取决于栈深度，而栈深度会达到 O(n) 的级别。
     */
    func reversePrint10(_ head: ListNode?) -> [Int] {
        var res = [Int]()
        var stack = [ListNode]()
        var node = head
        while node != nil {
            stack.append(node!)
            node = node!.next
        }
        while !stack.isEmpty {
            res.append(stack.popLast()!.val)
        }
        return res
    }
    
    // MARK: 先遍历后翻转
    
    /*
     - 时间复杂度：O(n)，其中 n 为链表节点的个数。链表的遍历中每个节点，翻转为n/2。
     - 空间复杂度：O(1)。不使用额外的栈空间，翻转是原地操作。
     */
    func reversePrint20(_ head: ListNode?) -> [Int] {
        var res = [Int]()
        var node = head
        while node != nil {
            res.append(node!.val)
            node = node!.next
        }
        reverseArray(&res)
        return res
    }

    func reverseArray(_ array: inout [Int]) {
        var left = 0, right = array.count - 1
        while left < right {
            array[left] = array[left] ^ array[right]
            array[right] = array[left] ^ array[right]
            array[left] = array[left] ^ array[right]
            left += 1
            right -= 1
        }
    }
}

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
