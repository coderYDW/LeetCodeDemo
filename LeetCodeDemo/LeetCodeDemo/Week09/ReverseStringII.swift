//
//  ReverseStringII.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2021/1/30.
//

import Foundation

/*
 541. 反转字符串 II
 给定一个字符串 s 和一个整数 k，你需要对从字符串开头算起的每隔 2k 个字符的前 k 个字符进行反转。

     如果剩余字符少于 k 个，则将剩余字符全部反转。
     如果剩余字符小于 2k 但大于或等于 k 个，则反转前 k 个字符，其余字符保持原样。
 
 提示：

     该字符串只包含小写英文字母。
     给定字符串的长度和 k 在 [1, 10000] 范围内。


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/reverse-string-ii
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class ReverseStringII {
    func reverseStr(_ s: String, _ k: Int) -> String {
        var s = Array(s)
        for i in stride(from: 0, to: s.count, by: 2 * k) {
            let right = (i + k - 1 > s.count - 1) ? (s.count - 1) : (i + k - 1)
            reverseString(&s, i, right)
        }
        return String(s)
    }

    func reverseString(_ s: inout [Character], _ left: Int, _ right: Int) {
        var left = left, right = right
        while left < right {
            s.swapAt(left, right)
            left += 1
            right -= 1
        }
    }
}