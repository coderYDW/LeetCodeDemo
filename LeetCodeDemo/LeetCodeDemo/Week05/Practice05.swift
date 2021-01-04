//
//  Practice05.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2021/1/2.
//

import Foundation

class Practice02 {
    //最长公共子序列
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        let n1 = text1.count, n2 = text2.count
        guard n1 > 0, n2 > 0 else {
            return 0
        }
        var dp = [[Int]](repeating: [Int](repeating: 0, count: n2 + 1), count: n1 + 1)
        let chars1 = Array(text1), chars2 = Array(text2)
        for i in 1...n1 {
            for j in 1...n2 {
                if chars1[i-1] == chars2[j-1] {
                    dp[i][j] = dp[i-1][j-1] + 1
                } else {
                    dp[i][j] = max(dp[i-1][j], dp[i][j-1])
                }
            }
        }
        return dp[n1][n2]
    }
    
    func minPathSum(_ grid: [[Int]]) -> Int {
        guard grid.count > 0 else {
            return 0
        }
        let m = grid.count, n = grid[0].count
        var dp = grid
        for i in 1..<m {
            dp[i][0] = dp[i - 1][0] + dp[i][0]
        }
        for j in 1..<n {
            dp[0][j] = dp[0][j - 1] + dp[0][j]
        }
        for i in 1..<m {
            for j in 1..<n {
                dp[i][j] = min(dp[i - 1][j], dp[i][j - 1]) + dp[i][j]
            }
        }
        return dp[m - 1][n - 1]
    }
    
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        guard m > 0, n > 0 else {
            return 0
        }
        var f = [Int](repeating: 1, count: n)
        for _ in 1..<m {
            for i in 1..<n {
                f[i] += f[i - 1]
            }
        }
        return f[n - 1]
    }
    
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        guard obstacleGrid.count > 0, obstacleGrid[0].count > 0 else {
            return 0
        }
        let m = obstacleGrid.count, n = obstacleGrid[0].count
        var f = [Int](repeating: 0, count: n)
        f[0] = 1
        for i in 0..<m {
            for j in 0..<n {
                if obstacleGrid[i][j] == 1 {
                    f[j] = 0
                    continue
                }
                if j >= 1 && obstacleGrid[i][j] == 0 {
                    f[j] += f[j - 1]
                }
            }
        }
        return f[n - 1]
    }
    
}
