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
    
}
