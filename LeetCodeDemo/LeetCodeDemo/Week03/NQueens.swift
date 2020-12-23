//
//  NQueens.swift
//  LeetCodeDemo
//
//  Created by Apple on 2020/12/23.
//

import Foundation

class NQueens {
    
    func solveNQueens(_ n: Int) -> [[String]] {
        var res = [[String]]()
        var queens = [Int](repeating: -1, count: n)
        var cols = Set<Int>(), dia1 = Set<Int>(), dia2 = Set<Int>()
        func backtrack(_ row: Int) {
            if row == n {
                res.append(generateQueensToString(queens, n))
                return
            }
            for i in 0..<n {
                if cols.contains(i) {
                    continue
                }
                let d1 = row - i
                if dia1.contains(d1) {
                    continue
                }
                let d2 = row + i
                if dia2.contains(d2) {
                    continue
                }
                queens[row] = i
                cols.insert(i)
                dia1.insert(d1)
                dia2.insert(d2)
                backtrack(row + 1)
                queens[row] = -1
                cols.remove(i)
                dia1.remove(d1)
                dia2.remove(d2)
            }
        }
        backtrack(0)
        return res
    }
    
    func generateQueensToString(_ queens: [Int], _ n: Int) -> [String] {
        var queensStrings = [String]()
        for i in 0..<n {
            var col = [Character](repeating: ".", count: n)
            col[queens[i]] = "Q"
            queensStrings.append(String(col))
        }
        return queensStrings
    }
}
