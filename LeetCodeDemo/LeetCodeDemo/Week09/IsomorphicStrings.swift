//
//  IsomorphicStrings.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2021/1/31.
//

import Foundation

/*
 给定两个字符串 s 和 t，判断它们是否是同构的。

 如果 s 中的字符可以按某种映射关系替换得到 t ，那么这两个字符串是同构的。

 每个出现的字符都应当映射到另一个字符，同时不改变字符的顺序。不同字符不能映射到同一个字符上，相同字符只能映射到同一个字符上，字符可以映射到自己本身。

  

 示例 1:

 输入：s = "egg", t = "add"
 输出：true

 示例 2：

 输入：s = "foo", t = "bar"
 输出：false

 示例 3：

 输入：s = "paper", t = "title"
 输出：true

  

 提示：

     可以假设 s 和 t 长度相同。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/isomorphic-strings
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        var s2t = [Character: Character]()
        var t2s = [Character: Character]()
        let s = Array(s), t = Array(t)
        for i in 0..<s.count {
            let x = s[i]
            let y = t[i]
            if s2t[x] != nil && s2t[x] != y || t2s[y] != nil && t2s[y] != x {
                return false
            }
            s2t[x] = y
            t2s[y] = x
        }
        return true
    }
}
