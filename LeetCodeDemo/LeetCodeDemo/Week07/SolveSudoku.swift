//
//  SolveSudoku.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2021/1/20.
//

import Foundation

class SolveSudoku {
    
    //第一种方式
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
                if board[i][j] == "." {
                    for c in "123456789" {
                        if isValid(board, i, j, c) {
                            board[i][j] = c
                            if solve(&board) {
                                return true
                            } else {
                                board[i][j] = "."
                            }
                        }
                    }
                    return false
                }
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
    
    
    //第二种方式(未成功)
    
    var cols = [Int](repeating: 0, count: 9)
    var rows = [Int](repeating: 0, count: 9)
    var block = [[Int]](repeating: [Int](repeating: 0, count: 3), count: 3)
    var valid = false
    var spaces = [[Int]]()
    
    func solveSudoku(_ board: inout [[Character]]) {
        for i in 0..<9 {
            for j in 0..<9 {
                if board[i][j] != "." {
                    let digit = Int(String(board[i][j]))! - 1
                    flip(i, j, digit)
                } else {
                    spaces.append([i, j])
                }
            }
        }

        while true {
            var modified = false
            for i in 0..<9 {
                for j in 0..<9 {
                    if board[i][j] == "." {
                        let mask = ~(rows[i] | cols[j] | block[i / 3][j / 3] & 0x1ff)
                        if mask & (mask - 1) == 0 {
                            let digit = hammingWeight(mask - 1);
                            flip(i, j, digit)
                            board[i][j] = Character(String(digit + 1))
                            modified = true
                        }
                    }
                }
            }
            if !modified {
                break
            }
        }

        for i in 0..<9 {
            for j in 0..<9 {
                if board[i][j] == "." {
                    spaces.append([i, j])
                }
            }
        }

        dfs(&board, 0)
    }

    func dfs(_ board: inout [[Character]], _ pos: Int) {
        if pos == spaces.count {
            valid = true
            return
        }
        var board = board
        let space = spaces[pos]
        let i = space[0], j = space[1]
        var mask = ~(rows[i] | cols[j] | block[i / 3][j / 3] & 0x1ff)
        while mask != 0 && !valid {
            let digitMask = mask & (-mask)
            let digit = hammingWeight(digitMask - 1)
            flip(i, j, digit)
            let temp = String(digit + 1)
            board[i][j] = Character(temp)
            dfs(&board, pos + 1)
            flip(i, j, digit)
            mask &= (mask - 1)
        }

    }

    func flip(_ i: Int, _ j: Int, _ digit: Int) {
        rows[i] ^= (1 << digit)
        cols[i] ^= (1 << digit)
        block[i / 3][j / 3] = (1 << digit)
    }
    
    func hammingWeight(_ n: Int) -> Int {
        var res = 0, n = n
        while n != 0 {
            n &= (n - 1)
            res += 1
        }
        return res
    }
    
    func test() {
        var a: [[Character]] = [["5","3",".",".","7",".",".",".","."],["6",".",".","1","9","5",".",".","."],[".","9","8",".",".",".",".","6","."],["8",".",".",".","6",".",".",".","3"],["4",".",".","8",".","3",".",".","1"],["7",".",".",".","2",".",".",".","6"],[".","6",".",".",".",".","2","8","."],[".",".",".","4","1","9",".",".","5"],[".",".",".",".","8",".",".","7","9"]]
        solveSudoku10(&a)
        print(a)
    }

}


