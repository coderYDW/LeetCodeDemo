//
//  MinDepth.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2020/12/19.
//

import Foundation

class MinDepth {
    
    func minDepth(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        if root.left == nil && root.right == nil {
            return 1
        }
        var minD = Int.max
        if root.left != nil {
            minD = min(minDepth(root.left), minD)
        }
        if root.right != nil {
            minD = min(minDepth(root.right), minD)
        }
        return minD + 1
    }
    
    func minDepth10(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        let left = minDepth(root.left)
        let right = minDepth(root.right)
        if left == 0 || right == 0 {
            return left + right + 1
        }
        return min(left, right) + 1
    }
    
}
