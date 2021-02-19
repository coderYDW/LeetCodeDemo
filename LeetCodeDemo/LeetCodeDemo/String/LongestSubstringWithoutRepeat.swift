//
//  LongestSubstringWithoutRepeat.swift
//  LeetCodeDemo
//
//  Created by 杨冬武 on 2021/2/18.
//

import Foundation
/*
 给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。
 */
class LongestSubstringWithoutRepeat {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        let n = s.count, s = Array(s)
        var charSet = Set<Character>()
        var rk = -1, ans = 0
        for i in 0..<n {
            if i != 0 {
                charSet.remove(s[i - 1])
            }
            while rk + 1 < n && !charSet.contains(s[rk + 1]) {
                charSet.insert(s[rk + 1])
                rk += 1
            }
            ans = max(ans, rk - i + 1)
        }
        return ans
    }
    
    /*
     国际站高票解答
     两个指针，从开头开始，
     一个指针从头开始遍历，
     用一个字典存储字符和对应的下标，
     如果发现字符存在，更新另一个指针到对应下标的后一位,
     每次遍历更新结果。
     */
    func lengthOfLongestSubstring10(_ s: String) -> Int {
        let n = s.count, s = Array(s)
        var dict = [Character: Int]()
        var j = 0, ans = 0
        for i in 0..<n {
            if dict[s[i]] != nil {
                j = max(j, dict[s[i]]! + 1)
            }
            dict[s[i]] = i
            ans = max(ans, i - j + 1)
        }
        return ans
    }
    
}
