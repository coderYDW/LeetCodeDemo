//
//  MinGeneticMutation.swift
//  LeetCodeDemo
//
//  Created by Apple on 2020/12/28.
//

import Foundation
class MinGeneticMutation {
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
    
    func test() {
        print(minMutation("AACCGGTT", "AACCGGTA", ["AACCGGTA"]))
    }
    
}
