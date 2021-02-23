//
//  PowerOfTwo.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2021/1/21.
//

import Foundation

class PowerOfTwo {
    
    //2的幂, 如果一个数是2的幂, 则这个数的二进制只有一个位是1
    
    /*
     n & (n - 1) 清除最低位的1, 如果结果等于0, 说明只有一位是1
     */
    func isPowerOfTwo(_ n: Int) -> Bool {
        return n > 0 && n & (n - 1) == 0
    }
    
    /*
     n & (-n) 保留最小位的1, 如果结果等于n, 说明只有一位是1
     */
    func isPowerOfTwo10(_ n: Int) -> Bool {
        return n > 0 && n & (-n) == n
    }
}
