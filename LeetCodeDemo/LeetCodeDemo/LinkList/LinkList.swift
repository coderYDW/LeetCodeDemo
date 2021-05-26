//
//  LinkList.swift
//  LeetCodeDemo
//
//  Created by Apple on 2021/2/22.
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    
    public init() {
        self.val = 0
        self.next = nil
    }
    
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    public init(_ val: Int,_ next: ListNode?) {
        self.val = val
        self.next = next
    }
    
}

class LinkList {
    
    public static func createList(_ n: Int) -> ListNode? {
        if n <= 0 {
            return nil
        }
        let dummy: ListNode = ListNode(0)
        var temp: ListNode? = dummy
        for i in 0..<n {
            temp?.next = ListNode(i)
            temp = temp?.next
        }
        return dummy.next
    }
    
    public static func printLinkList(_ head: ListNode?) {
        var str = ""
        var isFirst = true
        var node = head
        while node != nil {
            if !isFirst {
                str.append("->\(node!.val)")
            } else {
                str.append("\(node!.val)")
                isFirst = false
            }
            node = node?.next
        }
        print(str)
    }
    
}
