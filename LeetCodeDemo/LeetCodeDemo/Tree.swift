//
//  Tree.swift
//  LeetCodeDemo
//
//  Created by Apple on 2020/12/17.
//

import Foundation

// MARK: - 二叉树
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

// MARK: - N叉树
public class Node {
    public var val: Int
    public var children: [Node]
    public init(_ val: Int) {
        self.val = val
        self.children = []
    }
}
