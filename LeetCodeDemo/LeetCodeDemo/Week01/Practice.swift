//
//  Practice.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2020/12/29.
//

import Foundation

class Practice {
    func minMutation(_ start: String, _ end: String, _ bank: [String]) -> Int {
        let bankSet: Set = Set(bank)
        guard bankSet.contains(end) else {
            return -1
        }
        var queue = [start]
        var visited: Set = [start]
        var res = 0
        while !queue.isEmpty {
            let n = queue.count
            for _ in 0..<n {
                let cur = queue.removeFirst()
                if minMutationHelper(cur, end, bankSet, &visited, &queue) {
                    return res + 1
                }
            }
            res += 1  // 每一层结束没有找到end后结果就加一
        }
        return -1
    }
    
    func minMutationHelper(_ cur: String, _ end: String, _ bankSet: Set<String>, _ visited: inout Set<String>, _ queue: inout [String]) -> Bool {
        var curArr = Array(cur)
        for i in 0..<curArr.count {
            let originChar = curArr[i]
            for g in "ACGT" {
                if g == originChar {
                    continue
                }
                curArr[i] = g
                let temp = String(curArr)
                if temp == end {
                    return true
                }
                if bankSet.contains(temp) && !visited.contains(temp) {
                    queue.append(temp)
                    visited.insert(temp)
                }
            }
            curArr[i] = originChar
        }
        return false
    }
    
    func largestValues(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }
        var queue = [root]
        var res = [Int]()
        while !queue.isEmpty {
            let n = queue.count
            var maxVal = Int.min
            for _ in 0..<n {
                let node = queue.removeFirst()
                maxVal = max(maxVal, node.val)
                if node.left != nil {
                    queue.append(node.left!)
                }
                if node.right != nil {
                    queue.append(node.right!)
                }
            }
            res.append(maxVal)
        }
        return res
    }
    
    func sortColors(_ nums: inout [Int]) {
        guard nums.count > 1 else {
            return
        }
        //0 [0, p0)
        //1 (p0, i)
        //2 (p2, n) n = nums.count
        var p0 = 0, i = 0, p2 = nums.count - 1
        while i <= p2 {
            if nums[i] == 0 {
                nums.swapAt(i, p0)
                p0 += 1
                i += 1
            } else if nums[i] == 2 {
                nums.swapAt(i, p2)
                p2 -= 1
            } else {
                i += 1
            }
        }
    }
    
}
