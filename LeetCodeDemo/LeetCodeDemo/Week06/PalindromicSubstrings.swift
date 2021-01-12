//
//  PalindromicSubstrings.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2021/1/12.
//

import Foundation

class PalindromicSubstrings {
    func countSubstrings(_ s: String) -> Int {
        let n = s.count
        var ans = 0
        let s = Array(s)
        for i in 0..<2 * n - 1 {
            var l = i / 2, r = i / 2 + i % 2
            while l >= 0 && r < n && s[l] == s[r] {
                l -= 1
                r += 1
                ans += 1
            }
        }
        return ans
    }
    
    func countSubstrings10(_ s: String) -> Int {
        var t = Array("$#")
        for c in s {
            t.append(c)
            t.append("#")
        }
        let n = t.count
        t.append("!")
        var f = [Int](repeating: 0, count: n)
        var iMax = 0, rMax = 0, ans = 0
        for i in 1..<n {
            f[i] = (i <= rMax) ? min(rMax - i + 1, f[2 * iMax - i]) : 1
            while t[i + f[i]] == t[i - f[i]] {
                f[i] += 1
            }
            if i + f[i] - 1 > rMax {
                iMax = i
                rMax = i + f[i] - 1
            }
            ans += (f[i] / 2)
        }
        return ans
    }
}
