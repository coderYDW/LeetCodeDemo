//
//  Minesweeper.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2020/12/26.
//

import Foundation

class Minesweeper {
    
    /*
     'M' 代表一个未挖出的地雷，
     'E' 代表一个未挖出的空方块，
     'B' 代表没有相邻（上，下，左，右，和所有4个对角线）地雷的已挖出的空白方块，
     'X' 则表示一个已挖出的地雷。
     数字（'1' 到 '8'）表示有多少地雷与这块已挖出的方块相邻，
     */
    
    let dx = [0, 1, 1, 1, 0, -1, -1, -1]
    let dy = [1, 1, 0, -1, -1, -1, 0, 1]
    
    // 深度优先
    func updateBoard(_ board: [[Character]], _ click: [Int]) -> [[Character]] {
        let x = click[0], y = click[1]
        var res = board
        if res[x][y] == "M" {
            //点到地雷
            res[x][y] = "X"
        } else {
            dfs(&res, x, y)
        }
        return res
    }
    
    func dfs(_ board: inout [[Character]], _ x: Int, _ y: Int) {
        var count = 0
        for i in 0..<8 {
            //查看周边有多少个地雷
            let tx = x + dx[i], ty = y + dy[i]
            if tx < 0 || tx >= board.count || ty < 0 || ty >= board.first!.count {
                continue
            }
            count += (board[tx][ty] == "M" ? 1 : 0)
        }
        if count > 0 {
            //有地雷 将地雷数量标记
            board[x][y] = Character("\(count)")
        } else {
            //无地雷 递归处理
            board[x][y] = "B"
            for i in 0..<8 {
                let tx = x + dx[i], ty = y + dy[i]
                if tx < 0 || tx >= board.count || ty < 0 || ty >= board.first!.count || board[tx][ty] != "E" {
                    continue
                }
                dfs(&board, tx, ty)
            }
        }
    }
    
    
    // 广度优先
    func updateBoard10(_ board: [[Character]], _ click: [Int]) -> [[Character]] {
        let x = click[0], y = click[1]
        var res = board
        if res[x][y] == "M" {
            res[x][y] = "X"
        } else {
            bfs(&res, x, y)
        }
        return res
    }
    
    func bfs(_ board: inout [[Character]], _ x: Int, _ y: Int) {
        var queue = [[x, y]]
        let row = board.count, col = board.first!.count
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: col), count: row)
        while !queue.isEmpty {
            let pos = queue.removeFirst()
            let x = pos[0], y = pos[1]
            var count = 0
            for i in 0..<8 {
                let tx = x + dx[i], ty = y + dy[i]
                if tx < 0 || tx >= row || ty < 0 || ty >= col {
                    continue
                }
                count += (board[tx][ty] == "M" ? 1 : 0)
            }
            if count > 0 {
                board[x][y] = Character("\(count)")
                continue
            }
            board[x][y] = "B"
            for i in 0..<8 {
                let tx = x + dx[i], ty = y + dy[i]
                if tx < 0 || tx >= row || ty < 0 || ty >= col || board[tx][ty] != "E" || visited[tx][ty] {
                    continue
                }
                queue.append([tx, ty])
                visited[tx][ty] = true
            }
        }
    }
    
    func test() {
        let board: [[Character]] = [["E","M","E","E","E"],["E","E","E","M","E"],["M","E","E","E","E"],["E","E","M","E","E"]]
        let click = [3, 4]
        let res = updateBoard(board, click)
        for i in res {
            print(i)
        }
    }
}
