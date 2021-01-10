//
//  DecodeWays.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2021/1/10.
//

import Foundation

class DecodeWays {
//    func numDecodings(_ s: String) -> Int {
//        if s.count <= 0 {
//            return 0
//        }
//        let s = Array(s)
//        if s[0] == "0" {
//            return 0
//        }
//        let n = s.count
//        var dp = [Int](repeating: 1, count: n + 1)
//        dp[0] = 1
//        dp[1] = s[0] == "0" ? 0 : 1
//        for i in 1..<n + 1 {
//
//            if Int(s[i]) < 7 && (s[i - 1] == "1" || s[i - 1] == "2") {
//                return 0
//            }
//
//        }
//        return dp[n]
//    }
}
