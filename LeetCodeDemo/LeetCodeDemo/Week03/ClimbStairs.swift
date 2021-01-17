//
//  ClimbStairs.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2020/12/23.
//

import Foundation

class ClimbStairs {
    //动态规划
    func climbStairs(_ n: Int) -> Int {
        var p = 0, q = 0, r = 1
        for _ in 0..<n {
            p = q
            q = r
            r = p + q
        }
        return r
    }
    
    //带缓存的递归
    var dic = [0: 1, 1: 1, 2: 2]
    func climbStairs10(_ n: Int) -> Int {
        if dic[n] == nil {
            dic[n] = climbStairs(n - 1) + climbStairs(n - 2)
        }
        return dic[n]!
    }
    //可以指定每步台阶数
    func climbStairs20(_ n: Int) -> Int {
        let steps = [1, 2]
        var dp = [Int](repeating: 0, count: n + 1)
        dp[0] = 1
        for i in 0..<n + 1 {
            for step in steps {
                if step <= i {
                    dp[i] += dp[i - step]
                }
            }
        }
        return dp[n]
    }
}
