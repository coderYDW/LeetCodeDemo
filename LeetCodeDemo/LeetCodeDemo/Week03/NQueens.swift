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
                res.append(generateBoard(queens, n))
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
    
    func generateBoard(_ queens: [Int], _ n: Int) -> [String] {
        var board = [String]()
        for i in 0..<n {
            var row = [Character](repeating: ".", count: n)
            row[queens[i]] = "Q"
            board.append(String(row))
        }
        return board
    }
    
    func solveNQueens10(_ n: Int) -> [[String]] {
        var res = [[String]]()
        var queens = [Int](repeating: -1, count: n)
        var colSet = Set<Int>(), diaSet1 = Set<Int>(), diaSet2 = Set<Int>()
        backtrack(0, n, &queens, &colSet, &diaSet1, &diaSet2, &res)
        return res
    }
    
    func backtrack(_ row: Int, _ n: Int, _ queens: inout [Int], _ colSet: inout Set<Int>, _ diaSet1: inout Set<Int>, _ diaSet2: inout Set<Int>, _ res: inout [[String]]) {
        if row == n {
            res.append(generateBoard(queens, n))
            return
        }
        for i in 0..<n {
            if colSet.contains(i) { continue }
            let dia1 = row - i
            if diaSet1.contains(dia1) { continue }
            let dia2 = row + i
            if diaSet2.contains(dia2) { continue }
            queens[row] = i
            colSet.insert(i); diaSet1.insert(dia1); diaSet2.insert(dia2)
            backtrack(row + 1, n, &queens, &colSet, &diaSet1, &diaSet2, &res)
            queens[row] = -1
            colSet.remove(i); diaSet2.remove(dia2); diaSet1.remove(dia1)
        }
    }
}
