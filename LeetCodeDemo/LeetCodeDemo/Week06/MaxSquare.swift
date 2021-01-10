//
//  MaxSquare.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2021/1/10.
//

import Foundation

class MaxSquare {
    
    // 最大正方形
    func maximalSquare(_ matrix: [[Character]]) -> Int {
        if matrix.count <= 0 || matrix[0].count <= 0 {
            return 0
        }
        let m = matrix.count, n = matrix[0].count
        var dp = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
        var maxSide = 0
        for i in 0..<m {
            for j in 0..<n {
                if matrix[i][j] == "1" {
                    if i == 0 || j == 0 {
                        dp[i][j] = 1
                    } else {
                        dp[i][j] = min(dp[i -  1][j], dp[i][j - 1], dp[i - 1][j - 1]) + 1
                    }
                    maxSide = max(maxSide, dp[i][j])
                }
            }
        }
        return maxSide * maxSide
    }
}
