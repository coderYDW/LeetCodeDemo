//
//  MajorityElement.swift
//  LeetCodeDemo
//
//  Created by Apple on 2020/12/22.
//

import Foundation

class MajorityElement {
    /*
     遍历存到字典里面,如果一个数出现的次数大于n/2,这个数就是众数
     */
    func majorityElement(_ nums: [Int]) -> Int {
        var hashMap = [Int: Int]()
        for (_, value) in nums.enumerated() {
            hashMap[value] = (hashMap[value] ?? 0) + 1
            if hashMap[value]! > nums.count / 2 {
                return value
            }
        }
        return -1
    }
    
    /*
     排序,后n/2处的数就是众数
     */
    func majorityElement10(_ nums: [Int]) -> Int {
        let a = nums.sorted()
        let halfIndex = nums.count / 2
        return a[halfIndex]
    }
    
    /*
     摩尔投票法:
     先假设第一个数过半数并设cnt=1；
     遍历后面的数如果相同则cnt+1，不同则减一，
     当cnt为0时则更换新的数字为候选数
     （成立前提：有出现次数大于n/2的数存在）
     */
    func majorityElement20(_ nums: [Int]) -> Int {
        var count = 0, res = 0
        for (_, value) in nums.enumerated() {
            if count == 0 {
                res = value
                count += 1
            } else {
                res == value ? (count += 1) : (count -= 1)
            }
        }
        return res
    }
}
