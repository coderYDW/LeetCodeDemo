//
//  CountingBits.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2021/1/24.
//

import Foundation

class CountingBits {
    
    func countBits(_ num: Int) -> [Int] {
        var dp = [Int](repeating: 0, count: num + 1)
        for i in 1..<num + 1 {
            dp[i] = dp[i >> 1] + i & 1
        }
        return dp
    }
    
    func countBits10(_ num: Int) -> [Int] {
        var dp = [Int](repeating: 0, count: num + 1)
        for i in 1..<num + 1 {
            dp[i] = dp[i & (i - 1)] + 1
        }
        return dp
    }
    
}
