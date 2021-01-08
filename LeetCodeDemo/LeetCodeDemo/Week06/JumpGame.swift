//
//  JumpGame.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2020/12/26.
//

import Foundation

class JumpGame {
    // MARK: - 跳跃游戏
    
    //贪心, 从前往后,维护最远距离
    func canJump(_ nums: [Int]) -> Bool {
        var reach = 0
        for i in 0..<nums.count {
            if i > reach {
                return false
            }
            reach = max(reach, i + nums[i])
        }
        return true
    }
    
    //贪心, 从后往前,维护终点
    func canJump10(_ nums: [Int]) -> Bool {
        var last = 0
        for (i, v) in nums.enumerated().reversed() {
            if i + v >= last {
                last = i
            }
        }
        return last == 0
    }
    func canJump20(_ nums: [Int]) -> Bool {
        var position = 0
        var i = nums.count - 1
        while i >= 0 {
            if i + nums[i] >= position {
                position = i
            }
            i -= 1
        }
        return position == 0
    }
    
    //动态规划(超时)
    func canJump30(_ nums: [Int]) -> Bool {
        let n = nums.count
        var dp = [Bool](repeating: false, count: n)
        dp[0] = true
        for i in 0..<n {
            for j in 0..<i {
                if dp[j] && j + nums[j] >= i {
                    dp[i] = true
                    break
                }
            }
        }
        return dp[n - 1]
    }
    
}
