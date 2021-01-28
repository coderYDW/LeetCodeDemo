//
//  MinCostClimbingStairs.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2021/1/26.
//

import Foundation

/*
 数组的每个下标作为一个阶梯，第 i 个阶梯对应着一个非负数的体力花费值 cost[i]（下标从 0 开始）。

 每当你爬上一个阶梯你都要花费对应的体力值，一旦支付了相应的体力值，你就可以选择向上爬一个阶梯或者爬两个阶梯。

 请你找出达到楼层顶部的最低花费。在开始时，你可以选择从下标为 0 或 1 的元素作为初始阶梯。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/min-cost-climbing-stairs
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

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
