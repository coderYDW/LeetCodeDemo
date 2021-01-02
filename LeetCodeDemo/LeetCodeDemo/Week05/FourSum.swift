//
//  FourSum.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2021/1/1.
//

import Foundation

class FourSum {
    /*四数之和*/
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        guard nums.count >= 4 else {
            return []
        }
        var res = [[Int]]()
        let nums = nums.sorted()
        let n = nums.count
        for i in 0..<n - 3 {
            if i > 0 && nums[i] == nums[i - 1] {
                continue
            }
            if nums[i] + nums[i + 1] + nums[i + 2] + nums[i + 3] > target{
                break
            }
            if nums[i] + nums[n - 1] + nums[n - 2] + nums[n - 3] < target {
                continue
            }
            for j in i + 1..<n - 2 {
                if j > i + 1 && nums[j] == nums[j - 1] {
                    continue
                }
                if nums[i] + nums[i + 1] + nums[i + 2] + nums[j] > target{
                    break
                }
                if nums[i] + nums[n - 1] + nums[n - 2] + nums[j] < target {
                    continue
                }
                var left = j + 1, right = n - 1
                while left < right {
                    let sum = nums[i] + nums[j] + nums[left] + nums[right]
                    if sum == target {
                        res.append([nums[i], nums[j], nums[left], nums[right]])
                        leftAddOne(&left, right, nums)
                        rightSubOne(left, &right, nums)
                    } else if sum < target {
                        leftAddOne(&left, right, nums)
                    } else {
                        rightSubOne(left, &right, nums)
                    }
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
}
