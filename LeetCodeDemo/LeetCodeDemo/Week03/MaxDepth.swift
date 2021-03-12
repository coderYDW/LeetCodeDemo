//
//  MaxDepth.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2020/12/18.
//

import Foundation

class MaxDepth {
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        let leftDepth = maxDepth(root.left)
        let rightDepth = maxDepth(root.right)
        return max(leftDepth, rightDepth) + 1
    }
}
