//
//  Practice06.swift
//  LeetCodeDemo
//
//  Created by Apple on 2021/1/6.
//

import Foundation

class Practice06 {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        guard amount > 0 else {
            return 0
        }
        var dp = [Int](repeating: amount + 1, count: amount + 1)
        dp[0] = 0
        for i in 1...amount {
            for coin in coins {
                if coin > i {
                    continue
                }
                dp[i] = min(dp[i], dp[i - coin] + 1)
            }
        }
        return dp[amount] == amount + 1 ? -1 : dp[amount]
    }
    
    func maxSubArray(_ nums: [Int]) -> Int {
        guard nums.count > 0 else {
            return 0
        }
        var pre = 0, ans = nums[0]
        for i in nums {
            pre = max(pre + i, i)
            ans = max(ans, pre)
        }
        return ans
    }
    
    func minPathSum(_ grid: [[Int]]) -> Int {
        guard grid.count > 0, grid.first!.count > 0 else {
            return 0
        }
        let m = grid.count, n = grid.first!.count
        var dp = grid
        for i in 1..<m {
            dp[i][0] = dp[i - 1][0] + dp[i][0]
        }
        for j in 1..<n {
            dp[0][j] = dp[0][j - 1] + dp[0][j]
        }
        for i in 1..<m {
            for j in 1..<n {
                dp[i][j] = min(dp[i - 1][j], dp[i][j - 1]) + dp[i][j]
            }
        }
        return dp[m - 1][n - 1]
    }
    
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        guard triangle.count > 0, triangle.last!.count > 0 else {
            return 0
        }
        let m = triangle.count
        var dp = triangle.last!
        for i in 0..<m - 1 {
            for j in 0..<triangle[i].count {
                dp[j] += dp[j + 1]
            }
        }
        return dp[0]
    }
    
    func maximalSquare(_ matrix: [[Character]]) -> Int {
        guard matrix.count > 0, matrix[0].count > 0 else {
            return 0
        }
        let m = matrix.count, n = matrix[0].count
        var dp = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
        var maxSide = 0
        for i in 0..<m {
            for j in 0..<n {
                if matrix[i][j] == "1" {
                    if i == 0 || j == 0 {
                        dp[i][j] = 1
                    } else {
                        dp[i][j] = min(dp[i - 1][j], dp[i][j - 1], dp[i - 1][j - 1]) + 1
                    }
                    maxSide = max(maxSide, dp[i][j])
                }
            }
        }
        return maxSide * maxSide
    }
    
    func numSquares(_ n: Int) -> Int {
        guard n > 0 else {
            return 0
        }
        var dp = [Int](repeating: n + 1, count: n + 1)
        dp[0] = 0
        for i in 1..<n + 1 {
            dp[i] = i
            var j = 1
            while i >= j * j {
                dp[i] = min(dp[i], dp[i - j * j] + 1)
                j += 1
            }
        }
        return dp[n]
    }
    
    func sortColors(_ nums: inout [Int]) {
        guard nums.count > 2 else {
            return
        }
        let n = nums.count
        // [0, p0) = 0
        // (p0, i) = 1
        // (p2, n) = 2
        var p0 = 0, p2 = n - 1, i = 0
        while i <= p2 {
            if nums[i] == 0 {
                nums.swapAt(i, p0)
                p0 += 1
                i += 1
            } else if nums[i] == 2 {
                nums.swapAt(i, p2)
                p2 -= 1
            } else {
                i += 1
            }
        }
    }
    
    //打家劫舍
    func rob(_ nums: [Int]) -> Int {
        let n = nums.count
        if n == 0 {
            return 0
        }
        if n == 1 {
            return nums[0]
        }
        let rob1 = robHelper(Array(nums[1..<n])) //不打劫第一间
        let rob2 = robHelper(Array(nums[0..<n - 1])) //不打劫最后一间
        return max(rob1, rob2)
    }
    func robHelper(_ nums: [Int]) -> Int {
        var pre = 0, cur = 0, temp: Int
        for i in nums {
            temp = cur
            cur = max(cur, pre + i)
            pre = temp
        }
        return cur
    }
    
    func maximalSquare01(_ matrix: [[Character]]) -> Int {
        guard matrix.count > 0, matrix.first!.count > 0 else {
            return 0
        }
        let m = matrix.count, n = matrix.first!.count
        var dp = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
        var maxSide = 0
        for i in 0..<m {
            for j in 0..<n {
                if matrix[i][j] == "1" {
                    if i == 0 || j == 0 {
                        dp[i][j] = 1
                    } else {
                        dp[i][j] = min(dp[i - 1][j], dp[i - 1][j - 1], dp[i][j - 1]) + 1
                    }
                    maxSide = max(maxSide, dp[i][j])
                }
            }
        }
        return maxSide * maxSide
    }
    
    func countSubstrings(_ s: String) -> Int {
        var t = Array("$#")
        let s = Array(s)
        for c in s {
            t.append(c)
            t.append("#")
        }
        let n = t.count
        t.append("!")
        var rMax = 0, iMax = 0, ans = 0
        var f = [Int](repeating: 0, count: n)
        for i in 1..<n {
            f[i] = i <= rMax ? min(rMax - i + 1, f[2 * iMax - i]) : 1
            while t[i + f[i]] == t[i - f[i]] {
                f[i] += 1
            }
            if i + f[i] - 1 > rMax {
                iMax = i
                rMax = i + f[i] - 1
            }
            ans += f[i] / 2
        }
        return ans
    }
    
    func countSubstrings10(_ s: String) -> Int {
        let s = Array(s), n = s.count
        var ans = 0
        for i in 0..<2 * n - 1 {
            var l = i / 2, r = i / 2 + i % 2
            while l >= 0 && r < n && s[l] == s[r] {
                ans += 1
                l -= 1
                r += 1
            }
        }
        return ans
    }
        
    func numSquares10(_ n: Int) -> Int {
        guard n > 1 else {
            return n
        }
        var dp = [Int](repeating: n + 1, count: n + 1)
        dp[0] = 0
        for i in 1..<n {
            dp[i] = i
            var j = 1
            while i >= j * j {
                dp[i] = min(dp[i], dp[i - j * j] + 1)
                j += 1
            }
        }
        return dp[n]
    }
    
    func countSubstrings20(_ s: String) -> Int {
        //字符串拼装
        var t = Array("$#")
        for c in s {
            t.append(c)
            t.append("#")
        }
        let n = t.count
        t.append("!")
        var f = [Int](repeating: 0, count: n)
        var iMax = 0, rMax = 0, ans = 0
        for i in 1..<n {
            f[i] = (i <= rMax) ? min(rMax - i + 1, f[2 * iMax - i]) : 1
            while t[i + f[i]] ==  t[i - f[i]] {
                f[i] += 1
            }
            if i + f[i] - 1 > rMax {
                iMax = i
                rMax = i + f[i] - 1
            }
            ans += (f[i] / 2)
        }
        return ans
    }
    
    func numDecodings(_ s: String) -> Int {
        let s = Array(s)
        if s[0] == "0" {
            return 0
        }
        var pre = 1, cur = 1
        for i in 1..<s.count {
            let temp = cur
            if s[i] == "0" {
                if "12".contains(s[i - 1]) {
                    cur = pre
                } else {
                    cur = 0
                }
            } else if s[i - 1] == "1" || s[i - 1] == "2" && "123456".contains(s[i]) {
                cur += pre
            }
            pre = temp
        }
        return cur
    }
}
