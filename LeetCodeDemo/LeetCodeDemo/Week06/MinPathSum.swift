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
}
