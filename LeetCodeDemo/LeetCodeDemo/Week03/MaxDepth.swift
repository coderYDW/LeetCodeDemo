//
//  MaxDepth.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2020/12/18.
//

import Foundation

class MaxDepth {
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        return max(maxDepth(root.left), maxDepth(root.right)) + 1
    }
}
