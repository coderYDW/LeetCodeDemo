//
//  Codec.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2020/12/20.
//

import Foundation

/// 序列化和反序列化一个二叉树

class Codec {
    
    func serialize(_ root: TreeNode?) -> String {
        var res = ""
        guard let root = root else {
            return res + "nil,"
        }
        res += "\(root.val),"
        res += serialize(root.left)
        res += serialize(root.right)
        return res
    }
    
    func deserialize(_ data: String) -> TreeNode? {
        var array = data.split(separator: ",")
        return deserializeHelper(&array)
    }
    func deserializeHelper(_ data: inout [Substring]) -> TreeNode? {
        if data.first == "nil" {
            data.removeFirst()
            return nil
        }
        let node = TreeNode(Int(String(data.first!))!)
        data.removeFirst()
        node.left = deserializeHelper(&data)
        node.right = deserializeHelper(&data)
        return node
    }
}
