//
//  DecodeWays.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2021/1/10.
//

import Foundation

class DecodeWays {
    
    func numDecodings(_ s: String) -> Int {
        let s = Array(s)
        var pre = 1, cur = 1
        if s[0] == "0" { return 0 }
        for i in 1..<s.count {
            let b = cur
            if s[i] == "0" {
                if "12".contains(s[i - 1]) {
                    cur = pre
                } else {
                    cur = 0
                }
            } else if s[i - 1] == "1" || s[i - 1] == "2" && "123456".contains(s[i]) {
                cur += pre
            }
            pre = b
        }
        return cur
    }
    
    
    func test() {
        print(numDecodings("1201234"))
    }
    
}
