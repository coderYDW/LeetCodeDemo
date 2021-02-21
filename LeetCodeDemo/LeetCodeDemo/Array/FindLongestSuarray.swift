//
//  FindLongestSuarray.swift
//  LeetCodeDemo
//
//  Created by 杨冬武 on 2021/2/20.
//

import Foundation

class FindLongestSuarray {
    
    /*
     滑动窗口
     */
    func findLength(_ A: [Int], _ B: [Int]) -> Int {
        let m = A.count, n = B.count
        var res = 0
        for i in 0..<m {
            let len = min(m - i, n)
            let maxLen = maxLength(A, B, i, 0, len)
            res = max(maxLen, res)
        }
        for i in 0..<n {
            let len = min(n - i, m)
            let maxLen = maxLength(A, B, 0, i, len)
            res = max(res, maxLen)
        }
        return res
    }
    
    func maxLength(_ A: [Int], _ B: [Int], _ addA: Int, _ addB: Int, _ len: Int) -> Int {
        var k = 0, maxLen = 0
        for i in 0..<len {
            if A[addA + i] == B[addB + i] {
                k += 1
            } else {
                k = 0
            }
            maxLen = max(k, maxLen)
        }
        return maxLen
    }
    
    /*
     动态规划
     */
    func findLength10(_ A: [Int], _ B: [Int]) -> Int {
        guard A.count > 0, B.count > 0 else {
            return 0
        }
        let m = A.count, n = B.count
        var dp = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: m + 1)
        var res = 0
        for i in 1..<m + 1 {
            for j in 1..<n + 1 {
                dp[i][j] = A[i - 1] == B[j - 1] ? dp[i - 1][j - 1] + 1 : 0
                res = max(dp[i][j], res)
            }
        }
        return res
    }
    
    
}
