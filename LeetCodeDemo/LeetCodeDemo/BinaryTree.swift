//
//  BinaryTree.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2020/12/12.
//

import Foundation

class BinaryTree {
    
    // MARK: 中序遍历
    
    /// 递归
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }
        var res = [Int]()
        res.append(contentsOf: inorderTraversal(root.left))
        res.append(root.val)
        res.append(contentsOf: inorderTraversal(root.right))
        return res
    }
    
    /// 迭代
    func inorderTraversal10(_ root: TreeNode?) -> [Int] {
        var stack = [TreeNode]()
        var res = [Int]()
        var node = root
        while node != nil || !stack.isEmpty {
            while node != nil {
                //如果有左节点,一直向左
                stack.append(node!)
                node = node!.left
            }
            //结果
            node = stack.popLast()
            res.append(node!.val)
            //右边节点
            node = node?.right
        }
        return res
    }
    /// 迭代
    func inorderTraversal11(_ root: TreeNode?) -> [Int] {
        var stack = [TreeNode]()
        var res = [Int]()
        var node = root
        while node != nil || !stack.isEmpty {
            if node != nil {
                //如果有左节点,一直向左
                stack.append(node!)
                node = node!.left
            } else {
                //结果
                node = stack.popLast()
                res.append(node!.val)
                //右边节点
                node = node?.right
            }
        }
        return res
    }
    
    /*
     Morris 算法
     1.current如果没有有左子节点,直接加入结果,current向右走一步
     2.predecessor节点就是当前current节点向左走一步,然后一直向右走至无法走为止
     3.predecessor处于最右,若不等于current,将predecessor右子节点指向current
     4.predecessor等于current说明遍历完左子树,断开链接,current向右走一步
     */
    func inorderTraversal20(_ root: TreeNode?) -> [Int] {
        var res = [Int]()
        var current = root
        var predecessor: TreeNode? = nil
        while current != nil {
            // 如果没有左子节点，则直接访问右子节点
            if current!.left == nil {
                res.append(current!.val)
                current = current!.right
                continue
            }
            //predecessor 节点就是当前 root 节点向左走一步 然后一直向右走至无法走为止
            predecessor = current!.left
            while predecessor!.right != nil && predecessor!.right !== current {
                predecessor = predecessor!.right
            }
            
            if predecessor!.right === current {
                // 说明左子树已经访问完了，我们需要断开链接
                predecessor!.right = nil
                res.append(current!.val)
                current = current!.right
            } else {
                // 让 predecessor 的右指针指向 root，继续遍历左子树
                predecessor!.right = current
                current = current!.left
            }
        }
        return res
    }
    
    // MARK: 前序遍历
    
    /// 递归
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }
        var res: [Int] = []
        res.append(root.val)
        res.append(contentsOf: preorderTraversal(root.left))
        res.append(contentsOf: preorderTraversal(root.right))
        return res
    }
    
    /// 迭代
    func preorderTraversal10(_ root: TreeNode?) -> [Int] {
        var stack = [TreeNode]()
        var res = [Int]()
        var node = root
        while node != nil || !stack.isEmpty {
            while node != nil {
                //节点加入
                res.append(node!.val)
                //有左一直向左
                stack.append(node!)
                node = node!.left
            }
            node = stack.popLast()
            //右边节点
            node = node?.right
        }
        return res
    }
    
    /// 迭代
    func preorderTraversal11(_ root: TreeNode?) -> [Int] {
        var res = [Int]()
        guard let root = root else {
            return res
        }
        var stack = [root]
        while !stack.isEmpty {
            let node = stack.popLast()
            res.append(node!.val)
            if node!.right != nil {
                stack.append(node!.right!)
            }
            if node!.left != nil {
                stack.append(node!.left!)
            }
        }
        return res
    }
    
    // MARK: 后序遍历
    
    /// 递归
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }
        var res = [Int]()
        res.append(contentsOf: postorderTraversal(root.left))
        res.append(contentsOf: postorderTraversal(root.right))
        res.append(root.val)
        return res
    }
    
    /// 迭代
    func postorderTraversal01(_ root: TreeNode?) -> [Int] {
        var stack = [TreeNode]()
        var res = [Int]()
        var node = root
        var prev: TreeNode? = nil
        while node != nil || !stack.isEmpty {
            //一路向左
            while node != nil {
                stack.append(node!)
                node = node!.left
            }
            node = stack.popLast()
            //右子节点等于nil,没有右子节点
            //右子节点等于prev,遍历完右子节点回到根节点
            if node?.right == nil || node?.right === prev {
                //值加入结果并设置为上次遍历值
                res.append(node!.val)
                prev = node
                //node设置为空,循环继续从栈内取值
                node = nil
            } else {
                //右子节点不为空,节点加入栈
                stack.append(node!)
                //向右走
                node = node!.right
            }
        }
        return res
    }
    
}

// MARK: -

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

