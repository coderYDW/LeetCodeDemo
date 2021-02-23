//
//  HouseRobberII.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2021/1/6.
//

import Foundation

class HouseRobberII {
    
    func rob(_ nums: [Int]) -> Int {
        let n = nums.count
        if n == 0 {
            return 0
        }
        if n == 1 {
            return nums[0]
        }
        let nums1 = Array(nums[1..<n]), nums2 = Array(nums[0..<n - 1])
        return max(robI(nums1), robI(nums2))
    }
    func robI(_ nums: [Int]) -> Int {
        var pre = 0, cur = 0, temp = 0
        for i in 0..<nums.count {
            temp = cur
            cur = max(pre + nums[i], cur)
            pre = temp
        }
        return cur
    }
}
