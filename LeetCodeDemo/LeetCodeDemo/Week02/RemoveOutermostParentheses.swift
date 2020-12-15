//
//  RemoveOutermostParentheses.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2020/12/9.
//

import Foundation

class RemoveOutermostParentheses {
    /// 移除最外层括号
    func removeOuterParentheses(_ S: String) -> String {
        var count = 0
        var res = ""
        for c in S {
            if c == ")" { count -= 1 }
            if count >= 1 { res.append(c) }
            if c == "(" { count += 1 }
        }
        return res
    }
}
