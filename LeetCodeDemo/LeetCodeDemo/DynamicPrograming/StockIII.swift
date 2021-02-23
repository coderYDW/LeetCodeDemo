//
//  StockIII.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2021/1/9.
//

import Foundation

class StockIII {
    func maxProfit(_ prices: [Int]) -> Int {
        let n = prices.count
        var buy1 = -prices[0], sell1 = 0
        var buy2 = -prices[0], sell2 = 0
        for i in 1..<n {
            buy1 = max(buy1, -prices[i])
            sell1 = max(sell1, buy1 + prices[i])
            buy2 = max(buy2, sell1 - prices[i])
            sell2 = max(sell2, buy2 + prices[i])
        }
        return sell2
    }
}
