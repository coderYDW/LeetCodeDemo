//
//  ReverseOnlyLetters.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2021/1/30.
//

import Foundation

/*
 给定一个字符串 S，返回 “反转后的” 字符串，其中不是字母的字符都保留在原地，而所有字母的位置发生反转。

 示例 1：

 输入："ab-cd"
 输出："dc-ba"

 示例 2：

 输入："a-bC-dEf-ghIj"
 输出："j-Ih-gfE-dCba"

 示例 3：

 输入："Test1ng-Leet=code-Q!"
 输出："Qedo1ct-eeLg=ntse-T!"

 提示：

     S.length <= 100
     33 <= S[i].ASCIIcode <= 122
     S 中不包含 \ or "

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/reverse-only-letters
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


class ReverseOnlyLetters {
    
    func reverseOnlyLetters(_ S: String) -> String {
        var S = Array(S)
        var left = 0, right = S.count - 1
        while left < right {
            if !S[left].isLetter {
                left += 1
                continue
            }
            if !S[right].isLetter {
                right -= 1
                continue
            }
            S.swapAt(left, right)
            left += 1
            right -= 1
        }
        return String(S)
    }
    
    func reverseOnlyLetters10(_ S: String) -> String {
        var stack = [Character](), ans = ""
        for c in S {
            if c.isLetter {
                stack.append(c)
            }
        }
        for c in S {
            if c.isLetter {
                ans.append(stack.popLast()!)
            } else {
                ans.append(c)
            }
        }
        return ans
    }
    
    func test() {
        print(reverseOnlyLetters("123456789"))
    }
}
