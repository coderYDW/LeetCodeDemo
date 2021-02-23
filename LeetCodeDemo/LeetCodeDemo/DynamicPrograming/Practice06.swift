//
//  Practice06.swift
//  LeetCodeDemo
//
//  Created by Apple on 2021/1/6.
//

import Foundation

class Practice06 {
    
    func minDistance(_ word1: String, _ word2: String) -> Int {
        
        let word1 = Array(word1), word2 = Array(word2)
        
        let m = word1.count, n = word2.count
        
        var dp = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: m + 1)
        for i in 0..<m + 1 {
            for j in 0..<n + 1 {
                if i == 0 {
                    dp[i][j] = j
                } else if j == 0 {
                    dp[i][j] = i
                } else {
                    var leftDown = dp[i - 1][j - 1]
                    if word1[i - 1] != word2[j - 1] {
                        leftDown += 1
                    }
                    dp[i][j] = min(dp[i][j - 1], dp[i - 1][j], leftDown)
                }
            }
        }
        return dp[m][n]
    }
    
}
