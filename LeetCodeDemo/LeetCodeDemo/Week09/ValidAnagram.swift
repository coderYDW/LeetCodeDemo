//
//  ValidAnagram.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2020/12/12.
//

import Foundation

class ValidAnagram {
    /// 有效异位词
    func isAnagram(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else {
            return false
        }
        if s.sorted() == t.sorted() {
            return true
        } else {
            return false
        }
    }
    
    // 数组方式
    func isAnagram01(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else {
            return false
        }
        var arr = [Int](repeating: 0, count: 26)
        let aCharUnicodeScalar = Int("a".unicodeScalars.first!.value)
        for c in s.unicodeScalars {
            arr[Int(c.value) - aCharUnicodeScalar] += 1
        }
        for c in t.unicodeScalars {
            arr[Int(c.value) - aCharUnicodeScalar] -= 1
        }
        guard arr.first( where: {$0 != 0} ) == nil else {
            return false
        }
        return true
    }
    
    //字典方式
    func isAnagram02(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else {
            return false
        }
        var hashMap = [Character: Int]()
        for c in s {
            hashMap[c] = hashMap[c] ?? 0 + 1
        }
        for c in t {
            if hashMap[c] == nil {
                return false
            }
            hashMap[c]! -= 1
            if hashMap[c]! < 0 {
                return false
            }
        }
        return true
    }
    
    
}
