//
//  TrieTree.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2021/1/16.
//

import Foundation

class TrieTreeNode {
    public var next = [Character: TrieTreeNode]()
    public var end: Bool
    
    public init() {
        self.end = false
    }
}

class Trie {

    var root: TrieTreeNode

    /** Initialize your data structure here. */
    init() {
        root = TrieTreeNode()
    }
    
    /** Inserts a word into the trie. */
    func insert(_ word: String) {
        var node = root
        for c in word {
            if node.next[c] == nil {
                node.next[c] = TrieTreeNode()
            }
            node = node.next[c]!
        }
        node.end = true
    }
    
    /** Returns if the word is in the trie. */
    func search(_ word: String) -> Bool {
        return findWord(word)?.end ?? false
    }
    
    /** Returns if there is any word in the trie that starts with the given prefix. */
    func startsWith(_ prefix: String) -> Bool {
        return findWord(prefix) != nil
    }
    
    func findWord(_ word: String) -> TrieTreeNode? {
        var node = root
        for c in word {
            if let next = node.next[c] {
                node = next
            } else {
                return nil
            }
        }
        return node
    }
    
    func test() {
        let word = "apple"
        let obj = Trie()
        obj.insert(word)
        let ret_2: Bool = obj.search(word)
        let ret_3: Bool = obj.startsWith("app")
        let ret_4: Bool = obj.search("app")
        let ret_5: Bool = obj.startsWith("apl")
        print(ret_2, ret_3, ret_4, ret_5);
    }
}

/**
 * Your Trie object will be instantiated and called as such:
 * let obj = Trie()
 * obj.insert(word)
 * let ret_2: Bool = obj.search(word)
 * let ret_3: Bool = obj.startsWith(prefix)
 */
