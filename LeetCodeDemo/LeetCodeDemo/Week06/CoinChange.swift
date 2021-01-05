//
//  CoinChange.swift
//  LeetCodeDemo
//
//  Created by Apple on 2021/1/5.
//

import Foundation

class CoinChange {
    //零钱兑换
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        guard amount > 0 else {
            return 0
        }
        var dp = [Int](repeating:amount + 1, count: amount + 1)
        dp[0] = 0
        for i in 1...amount {
            for coin in coins {
                if coin <= i {
                    dp[i] = min(dp[i], dp[i - coin] + 1)
                }
            }
        }
        return dp[amount] > amount ? -1 : dp[amount]
    }
    
}
