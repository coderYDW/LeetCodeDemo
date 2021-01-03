//
//  MaxSubarray.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2020/12/31.
//

import Foundation

class MaxSubarray {
    
    // 动态规划
    func maxSubArray(_ nums: [Int]) -> Int {
        var pre = 0, ans = nums[0]
        for i in nums {
            pre = max(pre + i, i)
            ans = max(pre, ans)
        }
        return ans
    }
}
