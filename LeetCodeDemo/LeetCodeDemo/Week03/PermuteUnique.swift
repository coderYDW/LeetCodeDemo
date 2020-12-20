//
//  PermuteUnique.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2020/12/20.
//

import Foundation

class PermuteUnique {
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        func backstrack(_ index: Int) {
            if temp.count == numsSorted.count {
                res.append(Array(temp))
                return
            }
            for i in 0..<numsSorted.count {
                if visited[i] || (i > 0 && numsSorted[i] == numsSorted[i - 1] && !visited[i - 1]) {
                    continue
                }
                temp.append(numsSorted[i])
                visited[i] = true
                backstrack(index + 1)
                visited[i] = false
                temp.remove(at: index)
            }
        }
        var res = [[Int]]()
        var temp = [Int]()
        let numsSorted = nums.sorted()
        var visited = [Bool](repeating: false, count: nums.count)
        backstrack(0)
        return res
    }
}
