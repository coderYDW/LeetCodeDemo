//
//  InvertTree.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2020/12/18.
//

import Foundation

class InvertTree {
    
    /*
     * 时间复杂度：O(n)，n为树的节点数。
     * 空间复杂度：O(n)，n为递归栈深度。
     */
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        //交换左右节点的值  drill down
        (root.left, root.right) = (invertTree(root.right), invertTree(root.left))
        return root
    }
    
    /*
     * 时间复杂度：O(n)，n为树的节点数。
     * 空间复杂度：O(n)，n为栈深度。
     */
    func invertTree10(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        var stack = [root]
        while !stack.isEmpty {
            let node = stack.popLast()
            (node!.left, node!.right) = (node!.right, node!.left)
            if let left = node?.left {
                stack.append(left)
            }
            if let right = node?.right {
                stack.append(right)
            }
        }
        return root
    }
    
}
