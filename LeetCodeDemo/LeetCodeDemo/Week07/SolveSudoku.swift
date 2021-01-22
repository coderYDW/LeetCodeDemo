//
//  SolveSudoku.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2021/1/20.
//

import Foundation

class SolveSudoku {
    
    /*
     第一种方式:
     直接找出空格位置
     对指定的空格和剩余的数字进行匹配
     效率更高
     */
    
    var rows = Array(repeating: Set("123456789"), count: 9)
    var cols = Array(repeating: Set("123456789"), count: 9)
    var blocks = Array(repeating: Set("123456789"), count: 9)
    var spaces = [[Int]]()
    func solveSudoku(_ board: inout [[Character]]) {
        let m = board.count, n = board[0].count
        for i in 0..<m {
            for j in 0..<n {
                if board[i][j] != "." {
                    let val = board[i][j]
                    rows[i].remove(val)
                    cols[j].remove(val)
                    blocks[getBlockIndex(i, j)].remove(val)
                } else {
                    spaces.append([i, j])
                }
            }
        }
        backtrack(0, &board)
    }
    
    @discardableResult
    func backtrack(_ iter: Int, _ board: inout [[Character]]) -> Bool {
        if iter == spaces.count {
            return true
        }
        let i = spaces[iter][0], j = spaces[iter][1], b = getBlockIndex(i, j)
        //三个方向可以填入的值取交集, 放到temp
        let temp = rows[i].intersection(cols[j]).intersection(blocks[b])
        for val in temp {
            rows[i].remove(val)
            cols[j].remove(val)
            blocks[b].remove(val)
            board[i][j] = val
            if backtrack(iter + 1, &board) {
                return true
            }
            board[i][j] = "."
            rows[i].insert(val)
            cols[j].insert(val)
            blocks[b].insert(val)
        }
        return false
    }
    
    func getBlockIndex(_ i: Int, _ j: Int) -> Int {
        return 3 * (i / 3) + j / 3
    }
    
    /*
     第二种方式:
     相比第一种方案每次都从1~9尝试, 会有一些无用的尝试操作
     */
    func solveSudoku10(_ board: inout [[Character]]) {
        guard board.count > 0, board[0].count > 0 else {
            return
        }
        solve(&board)
    }
    
    @discardableResult
    func solve(_ board: inout [[Character]]) -> Bool {
        for i in 0..<9 {
            for j in 0..<9 {
                if board[i][j] != "." {
                    continue
                }
                //没有值
                for c in "123456789" {
                    if !isValid(board, i, j, c) {
                        continue
                    }
                    //c是有效的, 设置值, 进行回溯
                    board[i][j] = c
                    if solve(&board) {
                        return true
                    }
                    board[i][j] = "."
                }
                return false
            }
        }
        return true
    }
    
    func isValid(_ board: [[Character]], _ i: Int, _ j: Int, _ c: Character) -> Bool {
        for k in 0..<9 {
            if board[i][k] == c {
                return false
            }
            if board[k][j] == c {
                return false
            }
            if board[3 * (i / 3) + k / 3][3 * (j / 3) + k % 3] == c {
                return false
            }
        }
        return true
    }
    
    
    
    func test() {
        var a: [[Character]] = [["5","3",".",".","7",".",".",".","."],["6",".",".","1","9","5",".",".","."],[".","9","8",".",".",".",".","6","."],["8",".",".",".","6",".",".",".","3"],["4",".",".","8",".","3",".",".","1"],["7",".",".",".","2",".",".",".","6"],[".","6",".",".",".",".","2","8","."],[".",".",".","4","1","9",".",".","5"],[".",".",".",".","8",".",".","7","9"]]
        solveSudoku(&a)
        print(a)
    }

    
}


