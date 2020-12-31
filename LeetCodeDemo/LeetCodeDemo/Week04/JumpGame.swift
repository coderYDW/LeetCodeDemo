//
//  JumpGame.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2020/12/26.
//

import Foundation

class JumpGame {
    
    func canJump(_ nums: [Int]) -> Bool {
        var reach = 0
        for i in 0..<nums.count {
            if i > reach {
                return false
            }
            reach = max(reach, i + nums[i])
        }
        return true
    }
    
    func canJump10(_ nums: [Int]) -> Bool {
        var last = 0
        for (i, v) in nums.enumerated().reversed() {
            if i + v >= last {
                last = i
            }
        }
        return last == 0
    }
    
    func canJump20(_ nums: [Int]) -> Bool {
        var position = 0
        var i = nums.count - 1
        while i >= 0 {
            if i + nums[i] >= position {
                position = i
            }
            i -= 1
        }
        return position == 0
    }
}
