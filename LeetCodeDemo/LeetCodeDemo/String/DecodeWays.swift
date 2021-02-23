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
                if Set("12").contains(s[i - 1]) {
                    cur = pre
                } else {
                    cur = 0
                }
            } else if s[i - 1] == "1" || s[i - 1] == "2" && Set("123456").contains(s[i]) {
                cur += pre
            }
            pre = b
        }
        return cur
    }
    
    
    func numDecodings10(_ s: String) -> Int {
        guard s.count > 0 else { return 0 }
        let digits = Array(s).map { Int(String($0))! }
        var dp = Array(repeating: 0, count: digits.count + 1)
        dp[0] = 1
        dp[1] = digits[0] == 0 ? 0 : 1
        for i in stride(from: 2, through: digits.count, by: 1) {
            dp[i] += (digits[i - 1] > 0 ? dp[i - 1] : 0)
            let num = digits[i - 2] * 10 + digits[i - 1]
            dp[i] += ((num >= 10 && num <= 26) ? dp[i - 2] : 0)
        }
        return dp[digits.count]
    }
    

    
    
    func test() {
        print(numDecodings("1201234"))
    }
    
}
