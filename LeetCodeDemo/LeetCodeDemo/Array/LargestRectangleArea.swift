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
    
    func largestRectangleArea10(_ heights: [Int]) -> Int {
        var heights = heights
        heights.append(0)
        var stack = [Int]()
        var ans = 0
        for i in heights.indices {
            while !stack.isEmpty && heights[stack.last!] >= heights[i] {
                let height = heights[stack.removeLast()]
                let length = i - (stack.last ?? -1) - 1
                ans = max(ans, height * length)
            }
            stack.append(i)
        }
        return ans
    }
}
