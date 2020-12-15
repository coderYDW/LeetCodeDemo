//
//  N_aryTree.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2020/12/13.
//

import Foundation

class NAryTree {
    /* 前序遍历 */
    /// 递归
    func preorder(_ root: Node?) -> [Int] {
        guard let root = root else {
            return []
        }
        var res = [Int]()
        res.append(root.val)
        for node in root.children {
            res += preorder(node)
        }
        return res
    }
    
    /// 迭代
    func preorder01(_ root: Node?) -> [Int] {
        guard let root = root else {
            return []
        }
        var stack = [Node]()
        stack.append(root)
        var res = [Int]()
        while !stack.isEmpty {
            let node = stack.popLast()
            res.append(node!.val)
            if node!.children.isEmpty {
                continue
            }
            for child in node!.children.reversed() {
                stack.append(child)
            }
        }
        return res
    }
    
    /* 后序遍历 */
    /// 递归
    func postorder(_ root: Node?) -> [Int] {
        guard let root = root else {
            return []
        }
        var res = [Int]()
        for node in root.children {
            res += postorder(node)
        }
        res.append(root.val)
        return res
    }
    
    /// 迭代
    func postorder01(_ root: Node?) -> [Int] {
        guard let root = root else {
            return []
        }
        var arr = [Node]()
        arr.append(root)
        var res = [Int]()
        while !arr.isEmpty {
            let node = arr.popLast()
            res.insert(node!.val, at: 0)
            if node!.children.isEmpty {
                continue
            }
            for child in node!.children {
                arr.append(child)
            }
        }
        return res
    }
    
    /* 层序遍历 */
    /// 递归 dfs
    func levelOrder(_ root: Node?) -> [[Int]] {
        var res = [[Int]]()
        func dfs(_ root: Node?, _ depth: Int) {
            guard let root = root else {
                return
            }
            if res.count <= depth {
                res.append([])
            }
            res[depth].append(root.val)
            for ch in root.children {
                dfs(ch, depth + 1)
            }
        }
        dfs(root, 0)
        return res
    }
    
    /// 迭代 bfs
    func levelOrder01(_ root: Node?) -> [[Int]] {
        var res = [[Int]]()
        guard let root = root else {
            return res
        }
        var queue = [Node]()
        queue.insert(root, at: 0)
        while !queue.isEmpty {
            var level = [Int]()
            for _ in 0..<queue.count {
                let current = queue.popLast()
                level.append(current!.val)
                if current!.children.isEmpty {
                   continue
                }
                for child in current!.children {
                    queue.insert(child, at: 0)
                }
            }
            res.append(level)
        }
        return res
    }
    
}

public class Node {
    public var val: Int
    public var children: [Node]
    public init(_ val: Int) {
        self.val = val
        self.children = []
    }
}
