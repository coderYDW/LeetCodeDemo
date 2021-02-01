//
//  LongestPalindromic.swift
//  LeetCodeDemo
//
//  Created by Apple on 2021/2/1.
//

import Foundation

/*
 给你一个字符串 s，找到 s 中最长的回文子串。
 示例 1：
 输入：s = "babad"
 输出："bab"
 解释："aba" 同样是符合题意的答案。

 示例 2：
 输入：s = "cbbd"
 输出："bb"

 示例 3：

 输入：s = "a"
 输出："a"

 示例 4：

 输入：s = "ac"
 输出："a"

 提示：

     1 <= s.length <= 1000
     s 仅由数字和英文字母（大写和/或小写）组成

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/longest-palindromic-substring
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class LongestPalindromic {
    
    //中心扩展法
    func longestPalindrome10(_ s: String) -> String {
        guard s.count > 1 else {
            return s
        }
        let s = Array(s)
        var start = 0, end = 0
        for i in 0..<s.count {
            let len1 = expandAroundCenter(s, i, i)
            let len2 = expandAroundCenter(s, i, i + 1)
            let len = max(len1, len2)
            if len > end - start {
                start = i - (len - 1) / 2
                end = i + len / 2
            }
        }
        return String(s[start..<end + 1])
    }
    
    func expandAroundCenter(_ s: [Character], _ left: Int, _ right: Int) -> Int {
        var l = left, r = right
        while l >= 0 && l < s.count && r < s.count && r < s.count && s[l] == s[r] {
            l -= 1
            r += 1
        }
        return r - l - 1
    }
}
