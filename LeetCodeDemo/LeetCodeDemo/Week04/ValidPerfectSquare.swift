//
//  ValidPerfectSquare.swift
//  LeetCodeDemo
//
//  Created by Apple on 2020/12/28.
//

import Foundation

class ValidPerfectSquare {
    // MARK: 完全平方根
    func isPerfectSquare(_ num: Int) -> Bool {
        var r = Int64(num)
        while r * r > num {
            r = (r + Int64(num) / r) / 2
        }
        return r * r == num
    }
}
