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
    
    func generateParenthesis(_ n: Int) -> [String] {
        var res = [String]()
        generateParenthesisHelper(0, 0, n, &res, "")
        return res
    }
    
    func generateParenthesisHelper(_ left: Int, _ right: Int, _ n: Int, _ res: inout [String], _ s: String) {
        if left == n && right == n {
            res.append(s)
            return
        }
        if left < n {
            generateParenthesisHelper(left + 1, right, n, &res, s + "(")
        }
        if right < left {
            generateParenthesisHelper(left, right + 1, n, &res, s + ")")
        }
    }
}
