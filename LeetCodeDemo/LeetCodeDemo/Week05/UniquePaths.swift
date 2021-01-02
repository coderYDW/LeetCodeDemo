//
//  UniquePaths.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2021/1/2.
//

import Foundation

class UniquePaths {
    //不同路径
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var dp = [[Int]](repeating: [Int](repeating: 1, count: n), count: m)
        for i in 1..<m {
            for j in 1..<n {
                dp[i][j] = dp[i - 1][j] + dp[i][j - 1]
            }
        }
        return dp[m - 1][n - 1]
    }
    
    func uniquePaths10(_ m: Int, _ n: Int) -> Int {
        var cur = [Int](repeating: 1, count: n)
        for i in 1..<m {
            for j in 1..<n {
                cur[j] = cur[j - 1]
            }
        }
        return cur[n - 1]
    }
    
}