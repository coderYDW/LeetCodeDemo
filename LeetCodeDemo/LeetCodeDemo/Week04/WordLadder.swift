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
        var wordSet = Set<String>(wordList)
        guard wordSet.contains(endWord) else {
            return 0
        }
        wordSet.remove(beginWord)
        var queue = [beginWord]
        var visited: Set<String> = [beginWord]
        
        var res = 1
        while !queue.isEmpty {
            let size = queue.count
            for _ in 0..<size {
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
        var tempArr = Array(curWord)
        for i in 0..<tempArr.count {
            let originC = tempArr[i]
            for j in "abcdefghijklmnopqrstuvwxyz" {
                tempArr[i] = j
                let tempStr = String(tempArr)
                if tempStr == endWord {
                    return true
                }
                if visited.contains(tempStr) || !wordSet.contains(tempStr) {
                    continue
                }
                queue.append(tempStr)
                visited.insert(tempStr)
            }
            tempArr[i] = originC
        }
        return false
    }
    
    //双向bfs
    func ladderLength10(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        let wordSet = Set<String>(wordList)
        guard wordSet.contains(endWord) else {
            return 0
        }
        var beginVisited: Set<String> = [beginWord]
        var endVisited: Set<String> = [endWord]
        var visited = Set<String>()
        
        var res = 1
        while !beginVisited.isEmpty && !endVisited.isEmpty {
            if beginVisited.count > endVisited.count {
                swap(&beginVisited, &endVisited)
            }
            var nextLevelVisited = Set<String>()
            for word in beginVisited {
                if changeWordEveryOneLetter10(word, endVisited, &visited, wordSet, &nextLevelVisited) {
                    return res + 1
                }
            }
            beginVisited = nextLevelVisited
            res += 1
        }
        return 0
    }
    
    func changeWordEveryOneLetter10(_ word: String, _ endVisited: Set<String>, _ visited: inout Set<String>, _ wordSet: Set<String>, _ nextLevelVisited: inout Set<String>) -> Bool {
        var wordArr = Array(word)
        for i in 0..<word.count {
            let originC = wordArr[i]
            for c in "abcdefghijklmnopqrstuvwxyz" {
                if originC == c {
                    continue
                }
                wordArr[i] = c
                let nextWord = String(wordArr)
                if endVisited.contains(nextWord) {
                    return true
                }
                if !wordSet.contains(nextWord) || visited.contains(nextWord) {
                    continue
                }
                nextLevelVisited.insert(nextWord)
                visited.insert(nextWord)
            }
            wordArr[i] = originC
        }
        return false
    }
    
    
}

