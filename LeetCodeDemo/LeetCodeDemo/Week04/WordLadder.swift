//
//  WordLadder.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2020/12/26.
//

import Foundation

class WordLadder {
    
    //单向bfs
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        let wordSet = Set(wordList)
        guard wordSet.contains(endWord) else {
            return 0
        }
        var queue = [beginWord]
        var visited: Set = [beginWord]
        var res = 1
        while !queue.isEmpty {
            let n = queue.count
            for _ in 0..<n {
                let word = queue.removeFirst()
                if changeWordEveryOneLetter(word, endWord, &queue, wordSet, &visited) {
                    return res + 1
                }
            }
            res += 1
        }
        return 0
    }
    
    func changeWordEveryOneLetter(_ curWord: String, _ endWord: String, _ queue: inout [String], _ wordSet: Set<String>, _ visited: inout Set<String>) -> Bool {
        var wordArr = Array(curWord)
        for i in 0..<wordArr.count {
            let originChar = wordArr[i]
            for j in "qwertyuiopasdfghjklmnbvcxz" {
                if j == originChar {
                    continue
                }
                wordArr[i] = j
                let tempStr = String(wordArr)
                if tempStr == endWord {
                    return true
                }
                if wordSet.contains(tempStr) && !visited.contains(tempStr) {
                    queue.append(tempStr)
                    visited.insert(tempStr)
                }
            }
            wordArr[i] = originChar
        }
        return false
    }
    
    //双向bfs
    func ladderLength10(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        let wordSet = Set(wordList)
        guard wordSet.contains(endWord) else {
            return 0
        }
        var beginSet: Set = [beginWord], endSet: Set = [endWord], visited: Set = [beginWord]
        var res = 1
        while !beginSet.isEmpty && !endSet.isEmpty {
            if beginSet.count > endSet.count {
                swap(&beginSet, &endSet)
            }
            var nextLevelSet = Set<String>()
            for word in beginSet {
                if changeWordEveryOneLetter10(word, endSet, wordSet, &visited, &nextLevelSet) {
                    return res + 1
                }
            }
            beginSet = nextLevelSet
            res += 1
        }
        return 0
    }
    
    func changeWordEveryOneLetter10(_ word: String, _ endSet: Set<String>, _ wordSet: Set<String>, _ visited: inout Set<String>, _ nextLevelSet: inout Set<String>) -> Bool {
        var wordArr = Array(word)
        for i in 0..<wordArr.count {
            let originChar = wordArr[i]
            for j in "qwertyuioplkjhgfdsazxcvbnm" {
                if originChar == j {
                    continue
                }
                wordArr[i] = j
                let tempStr = String(wordArr)
                if endSet.contains(tempStr) {
                    return true
                }
                if wordSet.contains(tempStr) && !visited.contains(tempStr) {
                    nextLevelSet.insert(tempStr)
                    visited.insert(tempStr)
                }
            }
            wordArr[i] = originChar
        }
        return false
    }
    
    
}

