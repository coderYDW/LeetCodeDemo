//
//  Trap.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2020/12/9.
//

import Foundation

class Trap {
    /// 接雨水
    func trap(_ height: [Int]) -> Int {
        var left = 0, right = height.count - 1
        var leftMax = 0, rightMax = 0, res = 0
        while left < right {
            if height[left] < height[right] {
                if height[left] < leftMax {
                    res += leftMax - height[left]
                } else {
                    leftMax = height[left]
                }
                left += 1
            } else {
                if height[right] < rightMax {
                    res += rightMax - height[right]
                } else {
                    rightMax = height[right]
                }
                right -= 1
            }
        }
        return res
    }
}
