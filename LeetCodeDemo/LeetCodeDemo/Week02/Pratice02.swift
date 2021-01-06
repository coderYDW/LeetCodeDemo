//
//  Pratice02.swift
//  LeetCodeDemo
//
//  Created by Apple on 2021/1/6.
//

import Foundation

class Pratice02 {
    // MARK: - 层序遍历 BFS
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else {
            return []
        }
        var res = [[Int]]()
        var queue = [root]
        while !queue.isEmpty {
            let n = queue.count
            var tempLevel = [Int]()
            for _ in 0..<n {
                let node = queue.removeFirst()
                tempLevel.append(node.val)
                if node.left != nil {
                    queue.append(node.left!)
                }
                if node.right != nil {
                    queue.append(node.right!)
                }
            }
            res.append(tempLevel)
        }
        return res
    }
    
    func largestValues(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }
        var queue = [root]
        var res = [Int]()
        while !queue.isEmpty {
            var tempQueue = [TreeNode]()
            var maxVal = queue[0].val
            for node in queue {
                maxVal = max(maxVal, node.val)
                if node.left != nil {
                    tempQueue.append(node.left!)
                }
                if node.right != nil {
                    tempQueue.append(node.right!)
                }
            }
            queue = tempQueue
            res.append(maxVal)
        }
        return res
    }
}
