//
//  LengthOfLastWord.swift
//  LeetCodeDemo
//
//  Created by Apple on 2021/1/28.
//

import Foundation
/*
 给定一个仅包含大小写字母和空格 ' ' 的字符串 s，返回其最后一个单词的长度。如果字符串从左向右滚动显示，那么最后一个单词就是最后出现的单词。

 如果不存在最后一个单词，请返回 0 。

 说明：一个单词是指仅由字母组成、不包含任何空格字符的 最大子字符串。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/length-of-last-word
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class LengthOfLastWord {
    
    func lengthOfLastWord(_ s: String) -> Int {
        let s = Array(s)
        var count = 0, i = s.count
        while i >= 0 {
            if s[i] == " " && count != 0 {
                break
            } else if s[i] != " " {
                count += 1
            }
            i -= 1
        }
        return count
    }
    
    func lengthOfLastWord10(_ s: String) -> Int {
        let arr = s.split(separator: " ")
        if let last = arr.last {
            return last.count
        }
        return 0
    }
}
