//
//  ValidPalindrome.swift
//  LeetCodeDemo
//
//  Created by Apple on 2021/1/31.
//

import Foundation

/*
 给定一个字符串，验证它是否是回文串，只考虑字母和数字字符，可以忽略字母的大小写。

 说明：本题中，我们将空字符串定义为有效的回文串。

 示例 1:

 输入: "A man, a plan, a canal: Panama"
 输出: true

 示例 2:

 输入: "race a car"
 输出: false

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/valid-palindrome
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class ValidPalindrome {
    func isPalindrome(_ s: String) -> Bool {
        let lowS = s.lowercased()
        var sArr = [Character]()
        for c in lowS {
            if c.isLetter || c.isNumber {
                sArr.append(c)
            }
        }
        var left = 0, right = sArr.count - 1
        while left < right {
            if sArr[left] != sArr[right] {
                return false
            }
            left += 1
            right -= 1
        }
        return true
    }
    
    func isPalindrome10(_ s: String) -> Bool {
        let lowS = s.lowercased()
        var sArr = ""
        for c in lowS {
            if c.isLetter || c.isNumber {
                sArr.append(c)
            }
        }
        let reverseLowS = sArr.reversed()
        return sArr == String(reverseLowS)
    }
    
    func test() {
        print(isPalindrome10("A man, a plan, a canal: Panama"))
    }
}
