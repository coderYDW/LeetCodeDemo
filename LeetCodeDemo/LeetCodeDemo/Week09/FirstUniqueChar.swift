//
//  FirstUniqueChar.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2021/1/25.
//

import Foundation

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
    //
//    func firstUniqChar20(_ s: String) -> Int {
//
//    }
    
}
