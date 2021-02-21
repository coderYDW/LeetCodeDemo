//
//  MinStack.swift
//  LeetCodeDemo
//
//  Created by Apple on 2021/2/7.
//

import Foundation

class MinStack {

    private var stack = [Int]()
    private var minStack = [Int]()

    /** initialize your data structure here. */
    init() {

    }
    
    func push(_ x: Int) {
        stack.append(x)
        if minStack.isEmpty {
            minStack.append(x)
        } else {
            minStack.append(min(x, minStack.last!))
        }
    }
    
    func pop() {
        _ = stack.removeLast()
        _ = minStack.popLast()
    }
    
    func top() -> Int {
        return stack.last!
    }
    
    func getMin() -> Int {
        return minStack.last!
    }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(x)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
 */
