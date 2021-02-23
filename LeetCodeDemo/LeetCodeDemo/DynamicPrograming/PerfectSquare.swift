//
//  PerfectSquare.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2021/1/10.
//

import Foundation

class PerfectSquare {
    //动态规划
    func numSquares(_ n: Int) -> Int {
        guard n > 0 else {
            return 0
        }
        var dp = [Int](repeating: n + 1, count: n + 1)
        dp[0] = 0
        for i in 1...n {
            dp[i] = i
            var j = 1
            while i >= j * j {
                dp[i] = min(dp[i], dp[i - j * j] + 1)
                //print(dp[i])
                j += 1
            }
        }
        return dp[n]
    }
    
    func test() {
        print(numSquares(2))
    }
}
