//
//  RelativeSortArray.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2021/1/24.
//

import Foundation

/*数组的相对排序*/

class RelativeSortArray {
    
    func relativeSortArray(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
        var dict = [Int: Int]()
        for i in arr1 {
            dict[i] = (dict[i] ?? 0) + 1
        }
        var res = [Int]()
        for j in arr2 {
            res.append(contentsOf: Array(repeating: j, count: dict[j]!))
            dict[j] = nil
        }
        for (key, val) in dict.sorted(by: {$0.0 < $1.0}) {
            res.append(contentsOf: Array(repeating: key, count: val))
        }
        return res
    }

    func relativeSortArray10(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
        var countArr = [Int](repeating: 0, count: 1001)
        for i in arr1 {
            countArr[i] += 1
        }
        var res = [Int]()
        for j in arr2 {
            res.append(contentsOf: Array(repeating: j, count: countArr[j]))
            countArr[j] = 0
        }
        for (index, value) in countArr.enumerated() where value > 0 {
            res.append(contentsOf: Array(repeating: index, count: value))
        }
        return res
    }

}
