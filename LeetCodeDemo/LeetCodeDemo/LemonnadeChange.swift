//
//  LemonnadeChange.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2020/12/10.
//

import Foundation

class LemonnadeChange {
    func lemonadeChange(_ bills: [Int]) -> Bool {
        var five = 0, ten = 0
        for b in bills {
            if b == 5 { five += 1 }
            else if b == 10 { five -= 1; ten += 1 }
            else if ten > 0 { five -= 1; ten -= 1 }
            else { five -= 3 }
            if five < 0 { return false }
        }
        return true
    }
}
