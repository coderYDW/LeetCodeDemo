//
//  NumberOfIsland.swift
//  LeetCodeDemo
//
//  Created by Apple on 2020/12/25.
//

import Foundation

class NumberOfIsland {
    func numIslands(_ grid: [[Character]]) -> Int {
        guard grid.count > 0, grid.first != nil, grid.first!.count > 0 else {
            return 0
        }
        func dfs(_ row: Int, _ col: Int) {
            guard row >= 0, row < rowCount, col >= 0, col < colCount, temp[row][col] == "1" else {
                return
            }
            temp[row][col] = "0"
            dfs(row + 1, col)
            dfs(row - 1, col)
            dfs(row, col + 1)
            dfs(row, col - 1)
        }
        var res = 0, temp = grid
        let rowCount = grid.count, colCount = grid.first!.count
        for row in 0..<rowCount {
            for col in 0..<colCount {
                if temp[row][col] == "1" {
                    res += 1
                }
                dfs(row, col)
            }
        }
        return res
    }
    
    func numIslands10(_ grid: [[Character]]) -> Int {
        guard grid.count > 0, grid.first != nil, grid.first!.count > 0 else {
            return 0
        }
        var res = 0, temp = grid
        let rowCount = grid.count, colCount = grid.first!.count
        for row in 0..<rowCount {
            for col in 0..<colCount {
                if temp[row][col] == "1" {
                    res += 1
                }
                dfs(row, col, rowCount, colCount, &temp)
            }
        }
        return res
    }
    
    func dfs(_ row: Int, _ col: Int, _ rowCount: Int, _ colCount: Int, _ temp: inout [[Character]]) {
        guard row >= 0, row < rowCount, col >= 0, col < colCount, temp[row][col] == "1" else {
            return
        }
        temp[row][col] = "0"
        dfs(row + 1, col, rowCount, colCount, &temp)
        dfs(row - 1, col, rowCount, colCount, &temp)
        dfs(row, col + 1, rowCount, colCount, &temp)
        dfs(row, col - 1, rowCount, colCount, &temp)
    }
    
    func numIslands20(_ grid: [[Character]]) -> Int {
        guard grid.count > 0, grid[0].count > 0 else {
            return 0
        }
        var temp = grid, res = 0
        let m = grid.count, n = grid[0].count
        for i in 0..<m {
            for j in 0..<n {
                if temp[i][j] == "1" {
                    res += 1
                    backtrack(i, j, m, n, &temp)
                }
            }
        }
        return res
    }
    
    func backtrack(_ i: Int, _ j: Int, _ m: Int, _ n: Int, _ temp: inout [[Character]]) {
        if i < 0 || i >= m || j < 0 || j >= n || temp[i][j] == "0" {
            return
        }
        temp[i][j] = "0"
        let di = [0, 1, 0, -1], dj = [1, 0, -1, 0]
        for k in 0..<4 {
            backtrack(i + di[k], j + dj[k], m, n, &temp)
        }
    }
    
}
