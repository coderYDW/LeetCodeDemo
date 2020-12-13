//
//  BinaryTree.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2020/12/12.
//

import Foundation

class BinaryTree {
    
    /* 中序遍历 */
    
    /// 递归
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }
        var res: [Int] = []
        res += inorderTraversal(root.left)
        res.append(root.val)
        res += inorderTraversal(root.right)
        return res
    }
    
    
    /// 迭代
    func inorderTraversal01(_ root: TreeNode?) -> [Int] {
        var stack: [TreeNode] = []
        var result: [Int] = []
        var node: TreeNode? = root
        while node != nil || !stack.isEmpty {
            while node != nil {
                stack.append(node!)
                node = node!.left
            }
            node = stack.popLast()
            result.append(node!.val)
            node = node?.right
        }
        return result
    }
    
    /// Morris 算法
    func inorderTraversal02(_ root: TreeNode?) -> [Int] {
        var current, predecessor: TreeNode?
        var res: [Int] = []
        current = root
        while current != nil {
            // 如果没有左孩子，则直接访问右孩子
            if current!.left == nil {
                res.append(current!.val)
                current = current!.right
            } else {
                // predecessor 节点就是当前 root 节点向左走一步，然后一直向右走至无法走为止
                predecessor = current!.left
                while predecessor!.right != nil && predecessor!.right !== current {
                    predecessor = predecessor!.right
                }
                
                // 让 predecessor 的右指针指向 root，继续遍历左子树
                if predecessor!.right === current {
                    predecessor!.right = nil
                    res.append(current!.val)
                    current = current!.right
                }
                // 说明左子树已经访问完了，我们需要断开链接
                else {
                    predecessor!.right = current
                    current = current!.left
                }
            }
        }
        return res
    }
    
    /* 前序遍历 */
    
    /// 递归
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }
        var res: [Int] = []
        res.append(root.val)
        res += preorderTraversal(root.left)
        res += preorderTraversal(root.right)
        return res
    }
    
}

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    
    public init() {
        self.val = 0;
        self.left = nil;
        self.right = nil;
    }
    
    public init(_ val: Int) {
        self.val = val;
        self.left = nil;
        self.right = nil;
    }
    
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
    
    
    
    
}

