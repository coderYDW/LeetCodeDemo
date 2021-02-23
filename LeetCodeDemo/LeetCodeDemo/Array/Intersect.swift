//
//  Intersect.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2020/12/7.
//

import Foundation

class Intersect {
    /// 350 两个数组的交集 II
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        guard nums1.count <= nums2.count else {
            return intersect(nums2, nums1)
        }
        var hs = [Int: Int](), res = [Int]()
        for num in nums1 {
            if let record = hs[num] {
                hs[num] = record + 1
            } else {
                hs[num] = 1
            }
        }
        for num in nums2 {
            if let record = hs[num] {
                if record > 0 {
                    res.append(num)
                    hs[num] = record - 1
                }
            }
        }
        return res
    }
    
    func test() {
        let nums1 = [1,2,2,1]
        let nums2 = [2,2]
        let result = intersect(nums1, nums2)
        print(result)
    }
}
