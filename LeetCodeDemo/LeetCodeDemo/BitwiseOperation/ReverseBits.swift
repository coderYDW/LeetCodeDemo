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
    
    //思路更清晰
    func reverseBits10(_ n: Int) -> Int {
        var n = UInt32(n), res = UInt32(0)
        for _ in 0..<32 {
            res <<= 1
            res |= n & 1
            n >>= 1
        }
        return Int(res)
    }
    
    func reverseBits20(_ n: Int) -> Int {
        let a = String(n, radix: 2)
        var str = String(a.reversed())
        let count = str.count
        if count < 32 {
            for _ in 0..<32 - count {
                str.append("0")
            }
        }
        if let num = Int(str, radix: 2) {
            return num
        }
        return 0
    }
}
