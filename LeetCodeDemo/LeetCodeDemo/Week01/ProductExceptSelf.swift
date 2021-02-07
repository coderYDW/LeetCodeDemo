//
//  ProductExceptSelf.swift
//  LeetCodeDemo
//
//  Created by 杨冬武 on 2021/2/6.
//

import Foundation

/*
 给你一个长度为 n 的整数数组 nums，其中 n > 1，返回输出数组 output ，其中 output[i] 等于 nums 中除 nums[i] 之外其余各元素的乘积。
 
 示例:

 输入: [1,2,3,4]
 输出: [24,12,8,6]

 提示：题目数据保证数组之中任意元素的全部前缀元素和后缀（甚至是整个数组）的乘积都在 32 位整数范围内。

 说明: 请不要使用除法，且在 O(n) 时间复杂度内完成此题。

 进阶：
 你可以在常数空间复杂度内完成这个题目吗？（ 出于对空间复杂度分析的目的，输出数组不被视为额外空间。）

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/product-of-array-except-self
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class ProductExceptSelf {
    
    func productExceptSelf10(_ nums: [Int]) -> [Int] {
        let n = nums.count
        var res = [Int](repeating: 0, count: n)
        var L = [Int](repeating: 1, count: n)
        var R = [Int](repeating: 1, count: n)
        for i in 1..<n {
            L[i] = L[i - 1] * nums[i - 1]
        }
        R[n - 1] = 1
        for j in (0..<n - 1).reversed() {
            R[j] = R[j + 1] * nums[j + 1]
        }
        for k in 0..<n {
            res[k] = L[k] * R[k]
        }
        return res
    }
    
    
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        let n = nums.count
        var res = [Int](repeating: 1, count: n)
        for i in 1..<n {
            res[i] = res[i - 1] * nums[i - 1]
        }
        var j = n - 1, r = 1
        while j >= 0 {
            res[j] = res[j] * r
            r *= nums[j]
            j -= 1
        }
        return res
    }
}
