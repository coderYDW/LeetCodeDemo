//
//  MinCostClimbingStairs.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2021/1/26.
//

import Foundation

class MinCostClimbingStairs {
    
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        guard cost.count >= 2 else {
            return 0
        }
        let n = cost.count
        var pre = 0, cur = 0, temp = 0
        for i in 2..<n + 1 {
            temp = min(pre + cost[i - 2], cur + cost[i - 1])
            pre = cur
            cur = temp
        }
        return cur
    }
    
    
    func minCostClimbingStairs10(_ cost: [Int]) -> Int {
        guard cost.count >= 2 else {
            return 0
        }
        let n = cost.count
        var dp = [Int](repeating: 0, count: n + 1)
        dp[0] = 0; dp[1] = 0
        for i in 2..<n + 1 {
            dp[i] = min(dp[i - 1] + cost[i - 1], dp[i - 2] + cost[i - 2])
        }
        return dp[n]
    }
}
