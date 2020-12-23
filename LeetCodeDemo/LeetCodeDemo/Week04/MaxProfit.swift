//
//  MaxProfit.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2020/12/23.
//

import Foundation

class MaxProfit {
    //贪心算法: 第二天与前一天的差值大于零,加入答案,既是最大收益
    func maxProfit(_ prices: [Int]) -> Int {
        var ans = 0
        for i in 1..<prices.count {
            ans += max(0, prices[i] - prices[i - 1])
        }
        return ans
    }
}
