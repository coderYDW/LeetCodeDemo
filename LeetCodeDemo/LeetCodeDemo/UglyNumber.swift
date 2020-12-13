//
//  UglyNumber.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2020/12/13.
//

import Foundation

/*
 我们把只包含质因子 2、3 和 5 的数称作丑数（Ugly Number）。
 可以用2|3|5相乘得到的数字叫做丑数
 */

class UglyNumber {
    func nthUglyNumber(_ n: Int) -> Int {
        var dp = [Int](repeating: 1, count: n)
        var a = 0, b = 0, c = 0
        for i in 1..<n {
            let n2 = dp[a] * 2, n3 = dp[b] * 3, n5 = dp[c] * 5
            dp[i] = min(n2, n3, n5)
            if dp[i] == n2 { a += 1 }
            if dp[i] == n3 { b += 1 }
            if dp[i] == n5 { c += 1 }
        }
        return dp[n - 1]
    }
}
