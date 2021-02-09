//
//  SlidingWindowMaximum.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2020/12/8.
//

import Foundation

// 1、使用双端队列存储窗口内的数据Index
// 2、加入新值前，判断窗口内的值需不需要划出
// 3、从后往前判断窗口内的值是否小于新加入的值
// 4、小于新入队的值出队
// 5、每次区队列头的值就是窗口的最大值

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
    
    
    func maxSlidingWindow10(_ nums: [Int], _ k: Int) -> [Int] {
        guard k > 0 && nums.count >= k else {
            return []
        }
        var queue = [Int]()
        var res = [Int]()
        for i in 0..<nums.count {
            if !queue.isEmpty && queue.first! == i - k {
                queue.removeFirst()
            }
            while !queue.isEmpty && nums[queue.last!] <= nums[i] {
                queue.removeLast()
            }
            queue.append(i)
            if i - k + 1 >= 0 {
                res.append(nums[queue.first!])
            }
        }
        return res
    }
    
    
    func test() {
        let nums = [1, -2, 3, -4, 5, 6, 7, 8, 2]
        let k = 3
        let result = maxSlidingWindow(nums, k)
        print(result)
    }
}


