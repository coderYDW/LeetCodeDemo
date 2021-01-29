//
//  FirstUniqueChar.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2021/1/25.
//

import Foundation

/*
 字符串中的第一个唯一字符
 给定一个字符串，找到它的第一个不重复的字符，并返回它的索引。如果不存在，则返回 -1。
 提示：你可以假定该字符串只包含小写字母。
 */

class FirstUniqueChar {
    
    func firstUniqChar(_ s: String) -> Int {
        var dict = [Character: Int]()
        for c in s {
            dict[c] = (dict[c] ?? 0) + 1
        }
        for (i, v) in s.enumerated() {
            if dict[v] == 1 {
                return i
            }
        }
        return -1
    }
    
    func firstUniqChar10(_ s: String) -> Int {
        var position = [Character: Int]()
        for (i, v) in s.enumerated() {
            position[v] = position[v] == nil ? i : -1
        }
        var first = s.count
        for val in position.values {
            if val != -1 && val < first {
                first = val
            }
        }
        return first == s.count ? -1 : first
    }
    
    
    func firstUniqChar30(_ s: String) -> Int {
        var sa = [Int](repeating: 0, count: 26)
        for c in s.unicodeScalars {
            sa[Int(c.value) - 97] += 1
        }
        var i = 0
        for c in s.unicodeScalars {
            if sa[Int(c.value) - 97] == 1 {
                return i
            }
            i += 1
        }
        return -1
    }
    
    
    //队列的方式
    func firstUniqChar20(_ s: String) -> Int {
        var position = [Character: Int]()
        var queue = [Pair]()
        for (i, v) in s.enumerated() {
            if position[v] == nil {
                position[v] = i
                queue.append(Pair(v, i))
            } else {
                position[v] = -1
                while !queue.isEmpty && position[queue.first!.char] == -1 {
                    queue.removeFirst()
                }
            }
        }
        return queue.isEmpty ? -1 : queue.first!.pos
    }
    
}

class Pair {
    public var char: Character
    public var pos: Int
    public init(_ char: Character,_ pos: Int) {
        self.char = char
        self.pos = pos
    }
}
