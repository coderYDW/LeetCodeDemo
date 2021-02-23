//
//  AddDigits.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2020/12/11.
//

import Foundation

class AddDigits {
    /// 各位相加
    /*
     思考
     x*100 + y*10 + z = x*99 + y*9 + x+y+z
     */
    
    func addDigits(_ num: Int) -> Int {
        return (num - 1) % 9 + 1
    }
    
    func addDigits01(_ num: Int) -> Int {
        if num % 9 == 0 {
            return num == 0 ? num : 9
        } else {
            return num % 9
        }
    }
    
    /// 递归
    func addDigits02(_ num: Int) -> Int {
        if num < 10 {
            return num
        } else {
            var sum = 0
            var temp = num
            while temp != 0 {
                sum += temp % 10;
                temp /= 10;
            }
            return addDigits(sum)
        }
    }
    
}
