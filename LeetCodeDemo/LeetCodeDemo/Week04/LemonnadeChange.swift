//
//  LemonnadeChange.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2020/12/10.
//

import Foundation

class LemonnadeChange {
    /// 柠檬水找零(贪心算法)
    func lemonadeChange(_ bills: [Int]) -> Bool {
        guard bills.count > 0, bills.first == 5 else {
            return false
        }
        var five = 0, ten = 0
        for b in bills {
            if b == 5 {
                five += 1
            } else if b == 10 {
                five -= 1; ten += 1
            } else if ten > 0 {
                five -= 1; ten -= 1
            } else {
                five -= 3
            }
            //每次找零结束后判断5元数量若小于0,找零失败
            if five < 0 {
                return false
            }
        }
        return true
    }
}
