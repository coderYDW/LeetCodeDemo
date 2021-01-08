//
//  JumpGameII.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2020/12/27.
//

import Foundation

class JumpGameII {
    
    /* 超时 从后往前贪心 */
    func jump(_ nums: [Int]) -> Int {
        if nums.count <= 1 {
            return 0
        }
        var position = nums.count - 1
        var step = 0
        while position > 0 {
            for i in 0..<position {
                let maxP = i + nums[i]
                if maxP >= position {
                    step += 1
                    position = i
                    break
                }
            }
        }
        return step
    }
    
    /* 从前往后贪心 */
    func jump10(_ nums: [Int]) -> Int {
        if nums.count <= 1 {
            return 0
        }
        var maxIndex = 0, step = 0, end = 0
        for i in 0..<nums.count - 1 {
            maxIndex = max(maxIndex, i + nums[i])
            if i == end {
                end = maxIndex
                step += 1
            }
        }
        return step
    }
    
    //动态规划,依次计算每个位置的最小步数(超时)
    func jump20(_ nums: [Int]) -> Int {
        let n = nums.count
        var dp = [Int](repeating: n + 1, count: n)
        dp[0] = 0
        for i in 1..<n {
            for j in 0..<i {
                if j + nums[j] >= i {
                    dp[i] = min(dp[i], dp[j] + 1)
                }
            }
        }
        return dp[n - 1]
    }
    
}
