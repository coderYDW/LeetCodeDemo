//
//  Permutations.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2020/12/19.
//

import Foundation

class Permutations {
    
    func permute(_ nums: [Int]) -> [[Int]] {
        func backtrack(_ n: Int, _ first: Int) {
            if first == n {
                res.append(Array(output))
            }
            for i in first..<n {
                output.swapAt(first, i)
                backtrack(n, first + 1)
                output.swapAt(first, i)
            }
        }
        var res = [[Int]]()
        var output = nums
        backtrack(output.count, 0)
        return res
    }
    
    
    func permute10(_ nums: [Int]) -> [[Int]] {
        func backtrack() {
            if temp.count == nums.count {
                res.append(Array(temp))
                return
            }
            for i in 0..<nums.count {
                if visited[i] == true {
                    continue
                }
                temp.append(nums[i])
                visited[i] = true
                backtrack()
                visited[i] = false
                temp.removeLast()
            }
        }
        var res = [[Int]]()
        var temp = [Int]()
        var visited = [Bool](repeating: false, count: nums.count)
        backtrack()
        return res
    }
    
}
