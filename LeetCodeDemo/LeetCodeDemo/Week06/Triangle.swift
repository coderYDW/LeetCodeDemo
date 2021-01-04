//
//  Triangle.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2021/1/3.
//

import Foundation

class Triangle {
    //从上往下
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        var dp = triangle
        let n = dp.count
        for i in 1..<n {
            dp[i][0] = dp[i - 1][0] + dp[i][0]
            for j in 1..<i {
                dp[i][j] = min(dp[i - 1][j], dp[i - 1][j - 1]) + dp[i][j]
            }
            dp[i][i] = dp[i - 1][i - 1] + dp[i][i]
        }
        var minVal = dp[n - 1][0]
        for i in 1..<n {
            minVal = min(minVal, dp[n - 1][i])
        }
        return minVal
    }
    
    //从下往上
    func minimumTotal10(_ triangle: [[Int]]) -> Int {
        var dp = triangle
        let n = dp.count
        for i in (0..<n - 1).reversed() {
            for j in 0...i {
                dp[i][j] = min(dp[i + 1][j], dp[i + 1][j + 1]) + dp[i][j]
            }
        }
        return dp[0][0]
    }
    //一维数组
    func minimumTotal20(_ triangle: [[Int]]) -> Int {
        let n = triangle.count
        var dp = triangle[n - 1]
        for i in (0..<n - 1).reversed() {
            for j in 0...i {
                dp[j] = min(dp[j], dp[j + 1]) + triangle[i][j]
            }
        }
        return dp[0]
    }
    
    func test() {
        print(minimumTotal20([[2],[3,4],[6,5,7],[4,1,8,3]]))
    }
}
