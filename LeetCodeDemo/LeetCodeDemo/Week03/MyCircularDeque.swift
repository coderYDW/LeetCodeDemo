//
//  MyCircularDeque.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2020/12/18.
//

import Foundation

class MyCircularDeque {
    var head: Int
    var tail: Int
    let size: Int
    var array: [Int]
    /** Initialize your data structure here. Set the size of the deque to be k. */
    init(_ k: Int) {
        head = 0
        tail = 0
        size = k + 1
        array = [Int](repeating: 0, count: k + 1)
    }
    
    /** Adds an item at the front of Deque. Return true if the operation is successful. */
    func insertFront(_ value: Int) -> Bool {
        if isFull() {
            return false
        }
        head = (head - 1 + size) % size
        array[head] = value
        return true
    }
    
    /** Adds an item at the rear of Deque. Return true if the operation is successful. */
    func insertLast(_ value: Int) -> Bool {
        if isFull() {
            return false
        }
        array[tail] = value
        tail = (tail + 1) % size
        return true
    }
    
    /** Deletes an item from the front of Deque. Return true if the operation is successful. */
    func deleteFront() -> Bool {
        if isEmpty() {
            return false
        }
        head = (head + 1) % size
        return true
    }
    
    /** Deletes an item from the rear of Deque. Return true if the operation is successful. */
    func deleteLast() -> Bool {
        if isEmpty() {
            return false
        }
        tail = (tail - 1 + size) % size
        return true
    }
    
    /** Get the front item from the deque. */
    func getFront() -> Int {
        if isEmpty() {
            return -1
        }
        return array[head]
    }
    
    /** Get the last item from the deque. */
    func getRear() -> Int {
        if isEmpty() {
            return -1
        }
        let pos = (tail - 1 + size) % size
        return array[pos]
    }
    
    /** Checks whether the circular deque is empty or not. */
    func isEmpty() -> Bool {
        return head == tail
    }
    
    /** Checks whether the circular deque is full or not. */
    func isFull() -> Bool {
        return head == ((tail + 1) % size)
    }
    
}

/**
 * Your MyCircularDeque object will be instantiated and called as such:
 * let obj = MyCircularDeque(k)
 * let ret_1: Bool = obj.insertFront(value)
 * let ret_2: Bool = obj.insertLast(value)
 * let ret_3: Bool = obj.deleteFront()
 * let ret_4: Bool = obj.deleteLast()
 * let ret_5: Int = obj.getFront()
 * let ret_6: Int = obj.getRear()
 * let ret_7: Bool = obj.isEmpty()
 * let ret_8: Bool = obj.isFull()
 */

extension MyCircularDeque {
    class func test() {
        let deque = MyCircularDeque(5)
        print(deque.getRear())
        print(deque.getFront())
        print(deque.insertLast(1))
        print(deque.insertFront(4))
        print(deque.insertLast(2))
        print(deque.insertLast(3))
        print(deque.insertLast(5))
        print(deque.insertLast(6))
        print(deque.head, deque.tail, deque.size)
        print(deque.array)
        print(deque.isFull())
        print(deque.isEmpty())
        print(deque.getRear())
        print(deque.getFront())
    }
}
