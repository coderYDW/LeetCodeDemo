//
//  IsValidBST.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2020/12/18.
//

import Foundation

class IsValidBST {
    
    /*
     递归
     时间复杂度:O(n)
     空间复杂度:O(n)
     */
    
    func isValidBST(_ root: TreeNode?) -> Bool {
        return helper(root, Int.min, Int.max)
    }
    func helper(_ root: TreeNode?, _ min: Int, _ max: Int) -> Bool {
        guard let root = root else {
            return true
        }
        if root.val >= max || root.val <= min {
            return false
        }
        let leftResult = helper(root.left, min, root.val)
        let rightResult = helper(root.right, root.val, max)
        return leftResult && rightResult
    }
    
    /*
     中序遍历
     时间复杂度:O(n)
     空间复杂度:O(n)
     */
    func isValidBST10(_ root: TreeNode?) -> Bool {
        var stack = [TreeNode]()
        var node = root
        var last = Int.min
        while node != nil || !stack.isEmpty {
            while node != nil {
                stack.append(node!)
                node = node!.left
            }
            node = stack.popLast()
            if node!.val <= last {
                return false
            }
            last = node!.val
            node = node!.right
        }
        return true
    }
    
    //中序遍历递归
    func isValidBST11(_ root: TreeNode?) -> Bool {
        //内嵌函数
        func inorder(_ root: TreeNode?) -> Bool {
            guard let root = root else {
                return true
            }
            if inorder(root.left) {
                if root.val <= last {
                    return false
                }
                last = root.val
                return inorder(root.right)
            }
            return false
        }
        var last = Int.min
        return inorder(root)
    }
    
    //中序遍历递归
    func isValidBST12(_ root: TreeNode?) -> Bool {
        var last = Int.min
        return inorder(root, &last)
    }
    func inorder(_ root: TreeNode?, _ last: inout Int) -> Bool {
        guard let root = root else {
            return true
        }
        if inorder(root.left, &last) {
            if root.val <= last {
                return false
            }
            last = root.val
            return inorder(root.right, &last)
        }
        return false
    }
    
}
