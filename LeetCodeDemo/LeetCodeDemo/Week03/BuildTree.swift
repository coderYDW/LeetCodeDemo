//
//  BuildTree.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2020/12/19.
//

import Foundation

class BuildTree {
    //根据前序遍历和中序遍历构造二叉树
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        guard preorder.count == inorder.count else {
            return nil
        }
        var inDict = [Int: Int]()
        for (index, value) in inorder.enumerated() {
            inDict[value] = index
        }
        return myBuildTree(preorder, inDict, 0, preorder.count - 1, 0, inorder.count - 1)
    }
    
    func myBuildTree(_ preorder: [Int], _ inDict: [Int: Int], _ preLeft: Int, _ preRight: Int, _ inLeft: Int, _ inRight: Int) -> TreeNode? {
        guard preLeft <= preRight && inLeft <= inRight else {
            return nil
        }
        let rootVal = preorder[preLeft]
        let rootIndex = inDict[rootVal]
        let node = TreeNode(rootVal)
        node.left = myBuildTree(preorder, inDict, preLeft + 1, rootIndex! - inLeft + preLeft, inLeft, rootIndex! - 1)
        node.right = myBuildTree(preorder, inDict, rootIndex! - inLeft + preLeft + 1, preRight, rootIndex! + 1, inRight)
        return node
    }
    
}
