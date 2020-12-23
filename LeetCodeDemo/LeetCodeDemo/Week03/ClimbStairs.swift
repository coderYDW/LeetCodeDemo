//
//  ClimbStairs.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2020/12/23.
//

import Foundation

class ClimbStairs {
    
    func climbStairs(_ n: Int) -> Int {
        var p = 0, q = 0, r = 1
        for _ in 0..<n {
            p = q
            q = r
            r = p + q
        }
        return r
    }
    
    //带缓存的递归
    var dic = [0: 1, 1: 1, 2: 2]
    func climbStairs10(_ n: Int) -> Int {
        if dic[n] == nil {
            dic[n] = climbStairs(n - 1) + climbStairs(n - 2)
        }
        return dic[n]!
    }
}
