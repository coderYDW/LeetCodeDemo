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
}
