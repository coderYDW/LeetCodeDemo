//
//  NumberOfOneBit.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2021/1/21.
//

import Foundation

class NumberOfOneBit {
    
    //位一的个数
    func hammingWeight(_ n: Int) -> Int {
        var res = 0, n = n
        while n != 0 {
            n &= (n - 1)
            res += 1
        }
        return res
    }
    
    func hammingWeight10(_ n: Int) -> Int {
        var count = 0, n = n
        while n != 0 {
            if n & 1 == 1{
                count += 1
            }
            n >>= 1
        }
        return count
    }
    
}
