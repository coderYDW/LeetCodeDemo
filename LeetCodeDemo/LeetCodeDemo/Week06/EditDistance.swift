//
//  EditDistance.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2021/1/8.
//

import Foundation

class EditDistance {
    //编辑距离
    func minDistance(_ word1: String, _ word2: String) -> Int {
        let m = word1.count, n = word2.count
        if m * n == 0 {
            return m + n
        }
        let word1 = Array(word1), word2 = Array(word2)
        var dp = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: m + 1)
        for i in 0..<m + 1 {
            for j in 0..<n + 1 {
                if i == 0 {
                    dp[i][j] = j
                } else if j == 0 {
                    dp[i][j] = i
                } else {
                    let left = dp[i - 1][j] + 1
                    let down = dp[i][j - 1] + 1
                    let leftDown = dp[i - 1][j - 1] + (word1[i - 1] == word2[j - 1] ? 0 : 1)
                    dp[i][j] = min(left, down, leftDown)
                }
            }
        }
        return dp[m][n]
    }
    
    func test() {
        let word1 = "horse", word2 = "ros"
        print(minDistance(word1, word2))
    }
}
