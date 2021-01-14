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
    
    func maximalSquare(_ matrix: [[Character]]) -> Int {
        guard matrix.count > 0, matrix[0].count > 0 else {
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
                        dp[i][j] = min(dp[i - 1][j], dp[i][j - 1], dp[i - 1][j - 1]) + 1
                    }
                    maxSide = max(maxSide, dp[i][j])
                }
            }
        }
        return maxSide * maxSide
    }
    
    func numSquares(_ n: Int) -> Int {
        guard n > 0 else {
            return 0
        }
        var dp = [Int](repeating: n + 1, count: n + 1)
        dp[0] = 0
        for i in 0..<n + 1 {
            dp[i] = i
            var j = 1
            while i >= j * j {
                dp[i] = min(dp[i], dp[i - j * j] + 1)
                j += 1
            }
        }
        return dp[n]
    }
    
    func sortColors(_ nums: inout [Int]) {
        guard nums.count > 2 else {
            return
        }
        let n = nums.count
        // [0, p0) = 0
        // (p0, i) = 1
        // (p2, n) = 2
        var p0 = 0, p2 = n - 1, i = 0
        while i <= p2 {
            if nums[i] == 0 {
                nums.swapAt(i, p0)
                p0 += 1
                i += 1
            } else if nums[i] == 2 {
                nums.swapAt(i, p2)
                p2 -= 1
            } else {
                i += 1
            }
        }
    }
    
    //打家劫舍
    func rob(_ nums: [Int]) -> Int {
        let n = nums.count
        if n == 0 {
            return 0
        }
        if n == 1 {
            return nums[0]
        }
        let rob1 = robHelper(Array(nums[1..<n])) //不打劫第一间
        let rob2 = robHelper(Array(nums[0..<n - 1])) //不打劫最后一间
        return max(rob1, rob2)
    }
    func robHelper(_ nums: [Int]) -> Int {
        var pre = 0, cur = 0, temp: Int
        for i in nums {
            temp = cur
            cur = max(cur, pre + i)
            pre = temp
        }
        return cur
    }
    
    func maximalSquare01(_ matrix: [[Character]]) -> Int {
        guard matrix.count > 0, matrix.first!.count > 0 else {
            return 0
        }
        let m = matrix.count, n = matrix.first!.count
        var dp = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
        var maxSide = 0
        for i in 0..<m {
            for j in 0..<n {
                if matrix[i][j] == "1" {
                    if i == 0 || j == 0 {
                        dp[i][j] = 1
                    } else {
                        dp[i][j] = min(dp[i - 1][j], dp[i - 1][j - 1], dp[i][j - 1]) + 1
                    }
                    maxSide = max(maxSide, dp[i][j])
                }
            }
        }
        return maxSide * maxSide
    }
    
}
