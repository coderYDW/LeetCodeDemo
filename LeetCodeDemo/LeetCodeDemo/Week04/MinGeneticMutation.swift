//
//  MinGeneticMutation.swift
//  LeetCodeDemo
//
//  Created by Apple on 2020/12/28.
//

import Foundation
class MinGeneticMutation {
    //单向BFS
    func minMutation(_ start: String, _ end: String, _ bank: [String]) -> Int {
        let bankSet = Set<String>(bank)
        guard bankSet.contains(end) else {
            return -1
        }
        var queue = [start]
        var visited = Set<String>()
        visited.insert(start)
        var res = 0
        while !queue.isEmpty {
            let levelCount = queue.count
            for _ in 0..<levelCount {
                let cur = queue.removeFirst()
                if changeGenetic(cur, end, bankSet, &queue, &visited) {
                    return res + 1
                }
            }
            res += 1
        }
        return -1
    }
    
    func changeGenetic(_ cur: String, _ end: String, _ bankSet: Set<String>, _ queue: inout [String], _ visited: inout Set<String>) -> Bool {
        var arr: [Character] = Array(cur)
        for i in 0..<arr.count {
            let originChar = arr[i]
            for g in "ACGT" {
                if originChar == g {
                    continue
                }
                arr[i] = g
                let next = String(arr)
                if next == end {
                    return true
                }
                if bankSet.contains(next) && !visited.contains(next) {
                    queue.append(next)
                    visited.insert(next)
                }
            }
            arr[i] = originChar
        }
        return false
    }
    
    //双向BFS
    func minMutation10(_ start: String, _ end: String, _ bank: [String]) -> Int {
        let bankSet = Set<String>(bank)
        guard bankSet.contains(end) else {
            return -1
        }
        var startSet: Set = [start], endSet: Set = [end], visited: Set = [start]
        var res = 0
        while !startSet.isEmpty && !endSet.isEmpty {
            if startSet.count > endSet.count {
                swap(&startSet, &endSet)
            }
            var nextSet = Set<String>()
            for word in startSet {
                if changeGenetic10(word, &nextSet, endSet, &visited, bankSet) {
                    return res + 1
                }
            }
            res += 1
            startSet = nextSet
        }
        return -1
    }
    
    func changeGenetic10(_ word: String, _ nextSet: inout Set<String>, _ endSet: Set<String>, _ visited: inout Set<String>, _ bankSet: Set<String>) -> Bool {
        var word = Array(word)
        for i in 0..<word.count {
            let originalChar = word[i]
            for c in "ACGT" {
                if originalChar == c {
                    continue
                }
                word[i] = c
                let temp = String(word)
                if endSet.contains(temp) {
                    return true
                }
                if bankSet.contains(temp) && !visited.contains(temp) {
                    nextSet.insert(temp)
                    visited.insert(temp)
                }
                word[i] = originalChar
            }
        }
        return false
    }
    
    func test() {
        print(minMutation10("AACCGGTT", "AACCGGTA", ["AACCGGTA"]))
    }
    
}
