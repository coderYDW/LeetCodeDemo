//
//  UniquePathsII.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2021/1/2.
//

import Foundation

class UniquePathsII {
    
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        guard obstacleGrid.count > 0 else {
            return 0
        }
        let m = obstacleGrid.count, n = obstacleGrid[0].count
        var dp = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
        dp[0][0] = 1
        for i in 0..<m {
            for j in 0..<n {
                if obstacleGrid[i][j] == 1 {
                    dp[i][j] = 0
                    continue
                }
                if i - 1 >= 0 {
                    dp[i][j] += dp[i - 1][j]
                }
                if j - 1 >= 0 {
                    dp[i][j] += dp[i][j - 1]
                }
            }
        }
        return dp[m-1][n-1]
    }
    
    
    func uniquePathsWithObstacles10(_ obstacleGrid: [[Int]]) -> Int {
        guard obstacleGrid.count > 0 else {
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
                if j - 1 >= 0 && obstacleGrid[i][j - 1] == 0 {
                    f[j] += f[j - 1]
                }
            }
        }
        return f[n - 1]
    }
    
}
