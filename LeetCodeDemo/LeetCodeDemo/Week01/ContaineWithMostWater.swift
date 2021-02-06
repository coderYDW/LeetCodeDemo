//
//  containeWithMostWater.swift
//  LeetCodeDemo
//
//  Created by 杨冬武 on 2021/2/6.
//

import Foundation

/*
 给你 n 个非负整数 a1，a2，...，an，每个数代表坐标中的一个点 (i, ai) 。在坐标内画 n 条垂直线，垂直线 i 的两个端点分别为 (i, ai) 和 (i, 0) 。找出其中的两条线，使得它们与 x 轴共同构成的容器可以容纳最多的水。

 说明：你不能倾斜容器。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/container-with-most-water
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class ContaineWithMostWater {
    //左右指针收敛法
    func maxArea(_ height: [Int]) -> Int {
        let n = height.count
        var res = 0, left = 0, right = n - 1
        while left < right {
            let s = (right - left) * min(height[left], height[right])
            res = max(res, s)
            if height[left] < height[right] {
                left += 1
            } else {
                right -= 1
            }
        }
        return res
    }
    //暴力法
    func maxArea10(_ height: [Int]) -> Int {
        var res = 0
        let n = height.count
        for i in 0..<n - 1 {
            for j in i + 1..<n {
                let s = (j - i) * min(height[i], height[j])
                res = max(res, s)
            }
        }
        return res
    }
    
    
}
