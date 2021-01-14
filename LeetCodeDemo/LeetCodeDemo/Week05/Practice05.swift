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
    
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        guard nums.count > 3 else {
            return []
        }
        let nums = nums.sorted()
        let n = nums.count
        if nums[n - 1] + nums[n - 2] + nums[n - 3] + nums[n - 4] < target {
            return []
        }
        if nums[0] + nums[1] + nums[2] + nums[3] > target {
            return []
        }
        var res = [[Int]](), left: Int, right: Int
        for i in 0..<n - 3 {
            if nums[i] + nums[i + 1] + nums[i + 2] + nums[i + 3] > target {
                break
            }
            if i > 0 && nums[i] == nums[i - 1] {
                continue
            }
            if nums[i] + nums[n - 1] + nums[n - 2] + nums[n - 3] < target {
                continue
            }
            for j in i + 1..<n - 2 {
                if nums[i] + nums[j + 1] + nums[j + 2] + nums[j] > target {
                    break
                }
                if nums[j] == nums[j - 1] {
                    continue
                }
                if nums[i] + nums[n - 1] + nums[n - 2] + nums[j] < target {
                    continue
                }
                left = j + 1
                right = n - 1
                while left < right {
                    let sum = nums[i] + nums[j] + nums[left] + nums[right]
                    if sum == target {
                        res.append([nums[i], nums[j], nums[left], nums[right]])
                        while left < right && nums[left] == nums[left + 1] {
                            left += 1
                        }
                        left += 1
                        while left < right && nums[right] == nums[right - 1] {
                            right -= 1
                        }
                        right -= 1
                    } else if sum < target {
                        while left < right && nums[left] == nums[left + 1] {
                            left += 1
                        }
                        left += 1
                    } else {
                        while left < right && nums[right] == nums[right - 1] {
                            right -= 1
                        }
                        right -= 1
                    }
                }
            }
        }
        return res
    }
    
    
    func fib(_ n: Int) -> Int {
        guard n >= 2 else {
            return n
        }
        var p = 0, q = 1, r = p + q
        for _ in 2..<n {
            p = q
            q = r
            r = p + q
        }
        return r
    }
}
