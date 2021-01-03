//
//  Fibonacci.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2021/1/3.
//

import Foundation

class Fibonacci {
    
    func fib(_ n: Int) -> Int {
        var a = 0, b = 1, sum = 0
        for _ in 0..<n {
            sum = (a + b) % 1000000007
            a = b
            b = sum
        }
        return a
    }
}
