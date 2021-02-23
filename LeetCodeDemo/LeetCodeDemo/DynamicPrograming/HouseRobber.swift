//
//  HouseRobber.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2021/1/6.
//

import Foundation

class HouseRobber {
    func rob(_ nums: [Int]) -> Int {
        let n = nums.count
        if n == 0 {
            return 0
        }
        if n == 1 {
            return nums[0]
        }
        var dp = [Int](repeating: 0, count: n)
        dp[0] = nums[0]
        dp[1] = max(nums[0], nums[1])
        for i in 2..<n {
            dp[i] = max(dp[i - 2] + nums[i], dp[i - 1])
        }
        return dp[n - 1]
    }
    
    func rob10(_ nums: [Int]) -> Int {
        let n = nums.count
        if n == 0 {
            return 0
        }
        if n == 1 {
            return nums[0]
        }
        var pre = nums[0], cur = max(nums[0], nums[1])
        for i in 2..<n {
            let temp = cur
            cur = max(pre + nums[i], pre)
            pre = temp
        }
        return cur
    }
    
    func rob20(_ nums: [Int]) -> Int {
        var pre = 0, cur = 0, temp: Int
        for i in 0..<nums.count {
            temp = cur
            cur = max(pre + nums[i], cur)
            pre = temp
        }
        return cur
    }
    
}
