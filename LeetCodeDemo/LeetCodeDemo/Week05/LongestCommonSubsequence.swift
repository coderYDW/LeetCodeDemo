//
//  LongestCommonSubsequence.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2021/1/1.
//

import Foundation

class LongestCommonSubsequence {
    //最长公共子序列
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        guard text1.count > 0, text2.count > 0 else {
            return 0
        }
        let n1 = text1.count, n2 = text2.count
        var dp = [[Int]](repeating: [Int](repeating: 0, count: n2 + 1), count: n1 + 1)
        let charArr1 = Array(text1), charArr2 = Array(text2)
        for i in 1..<n1 + 1 {
            for j in 1..<n2 + 1 {
                //如果相等对角线加一,如果不等上左最大值
                if charArr1[i - 1] == charArr2[j - 1] {
                    dp[i][j] = dp[i - 1][j - 1] + 1
                } else {
                    dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
                }
            }
        }
        return dp[n1][n2]
    }
    
    
}
