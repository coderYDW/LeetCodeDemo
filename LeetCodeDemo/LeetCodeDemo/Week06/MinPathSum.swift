//
//  MinPathSum.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2021/1/3.
//

import Foundation

class MinPathSum {
    //最小路径和
    func minPathSum(_ grid: [[Int]]) -> Int {
        guard grid.count > 0 else {
            return 0
        }
        let m = grid.count, n = grid[0].count
        var dp = grid
        for i in 1..<m {
            dp[i][0] = dp[i][0] + dp[i - 1][0]
        }
        for j in 1..<n {
            dp[0][j] = dp[0][j] + dp[0][j - 1]
        }
        for i in 1..<m {
            for j in 1..<n {
                dp[i][j] = min(dp[i - 1][j], dp[i][j - 1]) + dp[i][j]
            }
        }
        return dp[m - 1][n - 1]
    }
    
    func minPathSum10(_ grid: [[Int]]) -> Int {
        guard grid.count > 0, grid.first!.count > 0 else {
            return 0
        }
        let m = grid.count, n = grid.first!.count
        var dp = grid
        for i in 0..<m {
            for j in 0..<n {
                if i == 0 && j != 0 {
                    dp[i][j] += dp[i][j - 1]
                } else if i != 0 && j == 0 {
                    dp[i][j] += dp[i - 1][j]
                } else if i != 0 && j != 0 {
                    dp[i][j] += min(dp[i][j - 1], dp[i - 1][j])
                }
            }
        }
        return dp[m - 1][n - 1]
    }
    
}
