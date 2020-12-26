//
//  SearchInRotatedSortedArray.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2020/12/26.
//

import Foundation

class SearchInRotatedSortedArray {
    func search(_ nums: [Int], _ target: Int) -> Int {
        let n = nums.count
        guard n > 0 else {
            return -1
        }
        if n == 1 {
            return target == nums[0] ? 0 : -1
        }
        var l = 0, r = n - 1
        while l <= r {
            let mid = (l + r) / 2
            if nums[mid] == target {
                return mid
            }
            if nums[l] <= nums[mid] {
                //左边有序
                if nums[l] <= target && nums[mid] > target {
                    //在左边
                    r = mid - 1
                } else {
                    //在右边
                    l = mid + 1
                }
            } else {
                //右边有序
                if nums[r] >= target && nums[mid] < target {
                    //在右边
                    l = mid + 1
                } else {
                    //在左边
                    r = mid - 1
                }
            }
        }
        return -1
    }
}
