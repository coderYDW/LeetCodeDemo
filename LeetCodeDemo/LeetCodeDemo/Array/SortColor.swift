//
//  SortColor.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2021/1/11.
//

import Foundation

class SortColor {
    //颜色分类
    //双指针
    func sortColors(_ nums: inout [Int]) {
        guard nums.count > 1 else {
            return
        }
        let n = nums.count
        // [0, p0) = 0
        // (p0, i) = 1
        // (p2, n) = 2
        var p0 = 0, p2 = n - 1, i = 0
        while i <= p2 {
            if nums[i] == 0 {
                nums.swapAt(i, p0)
                p0 += 1
                i += 1
            } else if nums[i] == 2 {
                nums.swapAt(i, p2)
                p2 -= 1
            } else {
                i += 1
            }
        }
    }
    
}
