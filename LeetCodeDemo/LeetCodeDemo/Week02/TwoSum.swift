//
//  TwoSum.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2020/12/7.
//

import Foundation

class TwoSum {
    /// 1 两数之和
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int: Int]()
        for i in 0 ..< nums.count {
            //如果存在返回
            if let index = dict[target - nums[i]] {
                return [index, i]
            }
            //如果不存在,记录值
            dict[nums[i]] = i
        }
        return []
    }
    
    func test() {
        let nums = [2,7,11,15]
        let target = 9
        let result = twoSum(nums, target)
        print(result)
    }
    
}


