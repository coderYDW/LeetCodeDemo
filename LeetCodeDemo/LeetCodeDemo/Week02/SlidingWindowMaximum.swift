//
//  SlidingWindowMaximum.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2020/12/8.
//

import Foundation

class SlidingWindowMaximum {
    /// 滑动窗口最大值
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        guard k > 0 && nums.count > 0 else {
            return []
        }
        var queue = [Int]()
        var res = [Int]()
        //没成窗前k个数
        for i in 0..<k {
            //入队前比较,小于新入队的数字直接移除
            while !queue.isEmpty && queue.last! < nums[i] {
                queue.removeLast()
            }
            //新数入队
            queue.append(nums[i])
        }
        //第一个结果得出
        res.append(queue.first!)
        //成窗后
        for i in k..<nums.count {
            //查看被移除的数是不是最大的数,是的话移除
            if queue.first! == nums[i - k] {
                queue.removeFirst()
            }
            //入队前比较,小于新入队的数字直接移除
            while !queue.isEmpty && queue.last! < nums[i] {
                queue.removeLast()
            }
            //新数入队
            queue.append(nums[i])
            //队的第一个数始终是最大的
            res.append(queue.first!)
        }
        return res
    }
    
    /*
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        guard k > 0 && nums.count > 0 else {
            return []
        }
        var queue = [Int]()
        var res = [Int]()
        var j = 1 - k
        for i in 0..<nums.count {
            if j > 0 && queue.first! == nums[j - 1] {
                queue.removeFirst()
            }
            while !queue.isEmpty && queue.last! < nums[i] {
                queue.removeLast()
            }
            queue.append(nums[i])
            if j >= 0 {
                res.append(queue.first!)
            }
            j += 1
        }
        return res
    }
    */
    
    func test() {
        let nums = [1, -2, 3, -4, 5, 6, 7, 8, 2]
        let k = 3
        let result = maxSlidingWindow(nums, k)
        print(result)
    }
}


