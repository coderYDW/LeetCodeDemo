//
//  FindMinInRotatedSortedArray.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2020/12/26.
//

import Foundation

class FindMinInRotatedSortedArray {
    func findMin(_ nums: [Int]) -> Int {
        let n = nums.count
        if n == 1 {
            return nums[0]
        }
        var minValue = Int.max
        var left = 0, right = nums.count - 1
        while left <= right {
            let mid = (left + right) / 2
            if nums[left] <= nums[mid] {
                //左未旋转
                minValue = min(nums[left], minValue)
                left = mid + 1
            } else {
                //右未旋转
                minValue = min(nums[mid], minValue)
                right = mid - 1
            }
        }
        return minValue
    }
    
    func findMin10(_ nums: [Int]) -> Int {
        let n = nums.count
        var left = 0, right = n - 1
        if nums[right] >= nums[0] {
            //未旋转
            return nums[0]
        }
        while left <= right {
            let mid = (left + right) / 2
            if nums[mid] > nums[mid + 1] {
                return nums[mid + 1]
            }
            if nums[mid - 1] > nums[mid] {
                return nums[mid]
            }
            if nums[left] < nums[mid] {
                //左未旋转
                left = mid + 1
            } else {
                //右未旋转
                right = mid - 1
            }
        }
        return -1
    }
}
