//
//  LongestCommonPrefix.swift
//  LeetCodeDemo
//
//  Created by Apple on 2021/1/29.
//

import Foundation

/*
 编写一个函数来查找字符串数组中的最长公共前缀。

 如果不存在公共前缀，返回空字符串 ""。
 
 提示:
 0 <= strs.length <= 200
 0 <= strs[i].length <= 200
 strs[i] 仅由小写英文字母组成
 */

class LongestCommonPrefix {
    
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard strs.count > 0 else {
            return ""
        }
        let firstStr = Array(strs.first!)
        for i in 0..<firstStr.count {
            let c = firstStr[i]
            for j in 1..<strs.count {
                let str = Array(strs[j])
                if str.count <= i || c != str[i] {
                    return String(firstStr[0..<i])
                }
            }
        }
        return String(firstStr)
    }
}
