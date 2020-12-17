//
//  LowestCommonAncestor.swift
//  LeetCodeDemo
//
//  Created by Apple on 2020/12/17.
//

import Foundation

class LowestCommonAncestor {
    
    /*
     时间复杂度：O(n)，其中n为树的节点总数。
     空间复杂度：O(n)，其中n为树的节点总数。
     */
    
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        //如果root为空直接就是空,如果root等于p或者q,直接就是最近公共祖先
        if root == nil || root === p || root === q { return root }
        //递归
        let left = lowestCommonAncestor(root!.left, p, q)
        let right = lowestCommonAncestor(root!.right, p, q)
        //根据情况处理返回值
        if left == nil { return right }
        if right == nil { return left }
        return root
    }
    
}
