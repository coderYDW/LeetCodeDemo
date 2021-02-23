//
//  CoinChangeII.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2021/1/7.
//

import Foundation

class CoinChangeII {
    
    /*
     组合数
     以硬币为基准
     用每一个硬币去匹配所有金额
     相当于对每一个金额组合了所有的硬币
     */
    func change(_ amount: Int, _ coins: [Int]) -> Int {
        if amount == 0 {
            return 1
        }
        if coins.count == 0 {
            return 0
        }
        var dp = [Int](repeating: 0, count: amount + 1)
        dp[0] = 1
        for coin in coins {
            if coin > amount {
                continue
            }
            for i in coin..<amount + 1 {
                dp[i] += dp[i - coin]
                debugPrint("coin = \(coin), amount = \(i), dp[\(i)] = \(dp[i])")
            }
        }
        return dp[amount]
    }
    
    /*
     排列数
     以金额为基准
     每一个金额, 都用不同的硬币去尝试
     相当于排列了所有的可能
     */
    func change10(_ amount: Int, _ coins: [Int]) -> Int {
        if amount == 0 {
            return 1
        }
        if coins.count == 0 {
            return 0
        }
        var dp = [Int](repeating: 0, count: amount + 1)
        dp[0] = 1
        for i in 0..<amount + 1 {
            for coin in coins {
                if coin <= i {
                    dp[i] = dp[i] + dp[i - coin]
                    debugPrint("amount = \(i), coin = \(coin), dp[\(i)] = \(dp[i])")
                }
            }
        }
        return dp[amount]
    }
    
    func test() {
        let res = change(5, [1,2,5])
        debugPrint(res)
        
        let res1 = change10(5, [1,2,5])
        debugPrint(res1)
    }
    
}
