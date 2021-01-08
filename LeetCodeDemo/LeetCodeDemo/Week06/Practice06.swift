//
//  Practice06.swift
//  LeetCodeDemo
//
//  Created by Apple on 2021/1/6.
//

import Foundation

class Practice06 {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        guard amount > 0 else {
            return 0
        }
        var dp = [Int](repeating: amount + 1, count: amount + 1)
        dp[0] = 0
        for i in 1...amount {
            for coin in coins {
                if coin > i {
                    continue
                }
                dp[i] = min(dp[i], dp[i - coin] + 1)
            }
        }
        return dp[amount] == amount + 1 ? -1 : dp[amount]
    }
    
    func maxSubArray(_ nums: [Int]) -> Int {
        guard nums.count > 0 else {
            return 0
        }
        var pre = 0, ans = nums[0]
        for i in nums {
            pre = max(pre + i, i)
            ans = max(ans, pre)
        }
        return ans
    }
    
    func minPathSum(_ grid: [[Int]]) -> Int {
        guard grid.count > 0, grid.first!.count > 0 else {
            return 0
        }
        let m = grid.count, n = grid.first!.count
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
    
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        guard triangle.count > 0, triangle.last!.count > 0 else {
            return 0
        }
        let m = triangle.count
        var dp = triangle.last!
        for i in 0..<m - 1 {
            for j in 0..<triangle[i].count {
                dp[j] += dp[j + 1]
            }
        }
        return dp[0]
    }
    
}
