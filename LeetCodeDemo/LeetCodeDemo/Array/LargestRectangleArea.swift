//
//  LargestRectangleArea.swift
//  LeetCodeDemo
//
//  Created by Apple on 2021/3/8.
//

import Foundation

/*
 给定 n 个非负整数，用来表示柱状图中各个柱子的高度。每个柱子彼此相邻，且宽度为 1 。

 求在该柱状图中，能够勾勒出来的矩形的最大面积。
 */

class LargestRectangleArea {
    
    func largestRectangleArea(_ heights: [Int]) -> Int {
        var heights = heights
        //添加一个元素0，作为哨兵，因为高度都大于等于0，都会进行计算面积
        heights.append(0)
        var stack = [Int]()
        var res = 0
        for i in heights.indices {
            //这里的heights[stack.last!] >= heights[i]大于或者大于等于都可以
            //两个数相等，左右边界都是一样的
            //如果栈顶的值大于新入栈的值，需要计算面积高度并移除栈顶元素，因为已经找到了右边界
            while !stack.isEmpty && heights[stack.last!] >= heights[i] {
                //计算面积
                let h = heights[stack.removeLast()]
                let w = i - (stack.last ?? -1) - 1
                res = max(res, w * h)
            }
            //否则将 i 入栈
            stack.append(i)
        }
        //移除临时添加的0
        heights.removeLast()
        return res
    }
    
    func largestRectangleArea10(_ heights: [Int]) -> Int {
        let n = heights.count
        var left = [Int](repeating: 0, count: n), right = [Int](repeating: n, count: n)
        var stack = [Int]()
        for i in 0..<n {
            while !stack.isEmpty && heights[stack.last!] >= heights[i] {
                right[stack.last!] = i
                _ = stack.popLast()
            }
            left[i] = stack.isEmpty ? -1 : stack.last!
            stack.append(i)
        }
        var ans = 0
        for i in 0..<n {
            ans = max(ans, (right[i] - left[i] - 1) * heights[i])
        }
        return ans
    }
    
    func largestRectangleArea20(_ heights: [Int]) -> Int {
        let n = heights.count
        guard n > 0 else {
            return 0
        }
        var lessFromLeft = [Int](repeating: 0, count: n)
        var lessFromRight = [Int](repeating: 0, count: n)
        lessFromLeft[0] = -1
        lessFromRight[n - 1] = n
        for i in 1..<n {
            var p = i - 1
            while p >= 0 && heights[p] >= heights[i] {
                p = lessFromLeft[p]
            }
            lessFromLeft[i] = p
        }
        for j in (0..<n - 1).reversed() {
            var p = j + 1
            while p < n && heights[p] >= heights[j] {
                p = lessFromRight[p]
            }
            lessFromRight[j] = p
        }
        var maxVal = 0
        for i in 0..<n {
            maxVal = max(maxVal, (lessFromRight[i] - lessFromLeft[i] - 1) * heights[i])
        }
        return maxVal
    }
    
}
