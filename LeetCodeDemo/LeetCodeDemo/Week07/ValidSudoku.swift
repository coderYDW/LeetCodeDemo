//
//  ValidSudoku.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2021/1/21.
//

import Foundation

class ValidSudoku {
    //有效的数独
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        var cols = [Set<Character>](repeating: [], count: 9)
        var rows = [Set<Character>](repeating: [], count: 9)
        var boxs = [Set<Character>](repeating: [], count: 9)
        for i in 0..<9 {
            for j in 0..<9 {
                let char = board[i][j]
                if char == "." {
                    continue
                }
                let boxIndex = (i / 3) * 3 + j / 3
                if rows[i].contains(char) || cols[j].contains(char) || boxs[boxIndex].contains(char) {
                    return false
                }
                rows[i].insert(char)
                cols[j].insert(char)
                boxs[boxIndex].insert(char)
            }
        }
        return true
    }
}
