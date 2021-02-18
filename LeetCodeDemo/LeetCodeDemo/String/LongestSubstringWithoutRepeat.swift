//
//  LongestSubstringWithoutRepeat.swift
//  LeetCodeDemo
//
//  Created by 杨冬武 on 2021/2/18.
//

import Foundation

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
}
