//
//  MaxArea.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2020/12/10.
//

import Foundation

/*
 左右指针夹逼办法
 1、初始左右指针最大宽度
 2、小值向内移动
 3、求面积和原来的面积比较，大的赋值
 */

class MaxArea {
    /// 最大区域
    func maxArea(_ height: [Int]) -> Int {
        var left = 0, right = height.count - 1, res = 0
        while left < right {
            let area = min(height[left], height[right]) * (right - left)
            if height[left] < height[right] {
                left += 1
            } else {
                right -= 1
            }
            res = max(res, area)
        }
        return res
    }
}
