//
//  UniquePaths.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2021/1/2.
//

import Foundation

class UniquePaths {
    //不同路径
    
    //二维数组
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        guard m > 0, n > 0 else {
            return 0
        }
        var dp = [[Int]](repeating: [Int](repeating: 1, count: n), count: m)
        for i in 1..<m {
            for j in 1..<n {
                dp[i][j] = dp[i - 1][j] + dp[i][j - 1]
            }
        }
        return dp[m - 1][n - 1]
    }
    
    //使用一维数组
    func uniquePaths10(_ m: Int, _ n: Int) -> Int {
        guard m > 0, n > 0 else {
            return 0
        }
        var cur = [Int](repeating: 1, count: n)
        for _ in 1..<m {
            for j in 1..<n {
                cur[j] = cur[j - 1]
            }
        }
        return cur[n - 1]
    }
    
    //数学组合数计算
    func uniquePaths20(_ m: Int, _ n: Int) -> Int {
        var ans = 1
        var x = n, y = 1
        while y < m {
            ans = ans * x / y
            x += 1
            y += 1
        }
        return ans
    }
    
}
