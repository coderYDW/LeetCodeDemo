//
//  RotateArray.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2021/1/8.
//

import Foundation

class RotateArray {
    func rotate(_ nums: inout [Int], _ k: Int) {
        let n = nums.count
        let k = k % n
        reverse(&nums, 0, n - 1)
        reverse(&nums, k, n - 1)
        reverse(&nums, 0, k - 1)
    }
    
    func reverse(_ nums: inout [Int], _ left: Int, _ right: Int) {
        var left = left, right = right
        while left < right {
            (nums[left], nums[right]) = (nums[right], nums[left])
            left += 1
            right -= 1
        }
    }
}
