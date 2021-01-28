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
    
    func countBits20(_ num: Int) -> [Int] {
        var dp = [Int](repeating: 0, count: num + 1)
        for i in 1..<num + 1 {
            dp[i] = dp[i >> 1] + i & 1
        }
        return dp
    }
    
    func countBits30(_ num: Int) -> [Int] {
        var ans = [Int](repeating: 0, count: num + 1)
        var i = 0, b = 1
        // [0, b) is calculated
        while b <= num {
            // generate [b, 2b) or [b, num) from [0, b)
            while i < b && i + b <= num {
                ans[i + b] = ans[i] + 1
                i += 1
            }
            i = 0
            b <<= 1
        }
        
        return ans
    }
    
    
}
