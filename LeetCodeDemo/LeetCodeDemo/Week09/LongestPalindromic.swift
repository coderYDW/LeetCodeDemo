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
    
    //动态规划(超时)
    func longestPalindrome(_ s: String) -> String {
        guard s.count > 1 else {
            return s
        }
        let n = s.count
        var dp = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
        var res = "", s = Array(s)
        for i in (0..<n).reversed() {
            for j in i..<n {
                // 两边相等且长度小于等于3
                // 两边相等且子串是回文串
                dp[i][j] = s[i] == s[j] && (j - i < 3 || dp[i + 1][j - 1])
                // 求最长子串
                if dp[i][j] && j - i + 1 > res.count {
                    res = String(s[i..<j + 1])
                }
            }
        }
        return res
    }
    
    //动态规划
    func longestPalindrome20(_ s: String) -> String {
        guard s.count > 1 else {
            return s
        }
        let n = s.count
        var dp = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
        var maxLengh = 1, begin = 0, s = Array(s)
        //中间赋值,空串
        for i in 0..<n {
            dp[i][i] = true
        }
        for j in 1..<n {
            for i in 0..<j {
                if s[i] != s[j] {
                    //如果两边不等,不是回文串
                    dp[i][j] = false
                } else if j - i < 3 {
                    //两边相等,且字符数小于等于3,是回文
                    dp[i][j] = true
                } else {
                    //两边相等字符大于三,子串是就是,子串不是就不是
                    dp[i][j] = dp[i + 1][j - 1]
                }
                //求所有是回文串的时候的最大长度
                if dp[i][j] && j - i + 1 > maxLengh {
                    maxLengh = j - i + 1
                    begin = i
                }
                
            }
        }
        return String(s[begin..<begin + maxLengh])
    }
    
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
    
    func test() {
        print(longestPalindrome("aaaaaa"))
    }
}
