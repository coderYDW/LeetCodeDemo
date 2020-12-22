//
//  Subset.swift
//  LeetCodeDemo
//
//  Created by Apple on 2020/12/21.
//

import Foundation

// MARK: 子集
class Subset {
    
    func subsets(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        var temp = [Int]()
        func backtrack(_ start: Int) {
            res.append(Array(temp))
            for i in start..<nums.count {
                temp.append(nums[i])
                backtrack(i + 1)
                temp.removeLast()
            }
        }
        backtrack(0)
        return res
    }
    
    
    func subsets10(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        let n = nums.count
        let p = 1 << n
        for i in 0..<p {
            var temp = [Int]()
            for j in 0..<n {
                if (i >> j) & 1 == 1  {
                    temp.append(nums[j])
                }
            }
            res.append(temp)
        }
        return res
    }
    
    func subsets20(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        var temp = [Int]()
        func backtrack(_ cur: Int) {
            if cur == nums.count {
                res.append(Array(temp))
                return
            }
            temp.append(nums[cur])
            backtrack(cur + 1)
            temp.removeLast()
            backtrack(cur + 1)
        }
        backtrack(0)
        return res
    }
    
}
