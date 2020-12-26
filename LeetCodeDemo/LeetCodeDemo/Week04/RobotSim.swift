//
//  RobotSim.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2020/12/26.
//

import Foundation

class RobotSim {
    struct Location: Hashable {
        var x: Int
        var y: Int
    }
    func robotSim(_ commands: [Int], _ obstacles: [[Int]]) -> Int {
        var res = 0, x = 0, y = 0, d = 0 // 0北, 1东, 2南, 3西
        let dx = [0, 1, 0, -1], dy = [1, 0, -1, 0]
        var obstacleSet = Set<Location>()
        for ob in obstacles {
            obstacleSet.insert(Location(x: ob[0], y: ob[1]))
        }
        for c in commands {
            if c == -2 {
                d = d == 0 ? 3 : d - 1
            } else if c == -1 {
                d = d == 3 ? 0 : d + 1
            } else {
                var step = c
                while step > 0 && !obstacleSet.contains(Location(x:x + dx[d], y: y + dy[d])) {
                    x += dx[d]
                    y += dy[d]
                    step -= 1
                }
                res = max(x * x + y * y, res)
            }
        }
        return res
    }
}
