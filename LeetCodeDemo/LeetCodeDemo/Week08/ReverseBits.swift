//
//  ReverseBits.swift
//  LeetCodeDemo
//
//  Created by Apple on 2021/1/21.
//

import Foundation

class ReverseBits {
    //颠倒二进制位
    func reverseBits(_ n: Int) -> Int {
        let n = UInt32(n)
        var res = UInt32(0)
        for i in 0..<32 {
            let temp = (n >> i) & 1
            res |= (temp << (31 - i))
        }
        return Int(res)
    }
}
