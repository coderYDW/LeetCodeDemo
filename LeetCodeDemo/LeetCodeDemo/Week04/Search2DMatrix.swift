//
//  Search2DMatrix.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2020/12/26.
//

import Foundation

class Search2DMatrix {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let m = matrix.count
        guard m > 0 else {
            return false
        }
        let n = matrix[0].count
        var l = 0, r = m * n - 1
        while l <= r {
            let mid = (l + r) / 2
            let midValue = matrix[mid / n][mid % n]
            if midValue == target {
                return true
            }
            if midValue > target {
                r = mid - 1
            } else {
                l = mid + 1
            }
        }
        return false
    }
}
