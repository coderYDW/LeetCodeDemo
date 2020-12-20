//
//  Pow.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2020/12/20.
//

import Foundation

class Pow {
    func myPow(_ x: Double, _ n: Int) -> Double {
        return n > 0 ? myPowHelper(x, n) : 1 / myPowHelper(x, -n)
    }
    func myPowHelper(_ x: Double, _ n: Int) -> Double {
        if x == 1.0 || n == 0 { return 1.0 }
        if x == 0.0 { return 0.0 }
        if n == 1 { return x }
        let y = myPowHelper(x, n / 2);
        return n % 2 == 0 ? y * y : y * y * x;
    }
}
