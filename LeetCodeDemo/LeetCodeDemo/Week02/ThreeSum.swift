//
//  ThreeSum.swift
//  LeetCodeDemo
//
//  Created by Apple on 2021/1/4.
//

import Foundation

class ThreeSum {
    /*三数之和*/
    func threeSum(_ nums: [Int]) -> [[Int]] {
        guard nums.count >= 3 else {
            return []
        }
        let nums = nums.sorted()
        let n = nums.count
        var res = [[Int]]()
        for i in 0..<n - 2 {
            if nums[i] > 0 {
                //最小的数大于0 直接不用做了
                break
            }
            if i > 0 && nums[i] == nums[i - 1] {
                continue
            }
            if nums[i] + nums[n - 1] + nums[n - 2] < 0 {
                continue
            }
            var left = i + 1, right = n - 1
            while left < right {
                let sum = nums[i] + nums[left] + nums[right]
                if sum == 0 {
                    res.append([nums[i], nums[left], nums[right]])
                    leftAddOne(&left, right, nums)
                    rightSubOne(left, &right, nums)
                } else if sum > 0 {
                    right += 1
                } else {
                    left -= 1
                }
            }
        }
        return res
    }
    
    func leftAddOne(_ left: inout Int, _ right: Int, _ nums: [Int]) {
        while left < right && nums[left] == nums[left + 1] {
            left += 1
        }
        left += 1
    }
    func rightSubOne(_ left: Int, _ right: inout Int, _ nums: [Int]) {
        while left < right && nums[right] == nums[right - 1] {
            right -= 1
        }
        right -= 1
    }
    
    func test() {
        let res = threeSum([-1, 0, 1, 2, -1, -4])
        print(res)
    }
}
