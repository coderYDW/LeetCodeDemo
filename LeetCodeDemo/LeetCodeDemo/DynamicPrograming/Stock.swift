//
//  Stock.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2021/1/27.
//

import Foundation

class Stock {
    func maxProfit(_ prices: [Int]) -> Int {
        if prices.count == 0 { return 0 }
        var minPrice = Int.max, profit = 0
        for i in prices {
            if i < minPrice {
                minPrice = i
            } else {
                profit = max(i - minPrice, profit)
            }
        }
        return profit
    }
    
    func maxProfit10(_ prices: [Int]) -> Int {
        if prices.count == 0 { return 0 }
        var minPrice = Int.max, profit = 0
        for i in prices {
            profit = max(i - minPrice, profit)
            minPrice = min(i, minPrice)
        }
        return profit
    }
}
