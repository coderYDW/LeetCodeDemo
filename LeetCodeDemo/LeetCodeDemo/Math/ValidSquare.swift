//
//  ValidSquare.swift
//  LeetCodeDemo
//
//  Created by 杨冬武 on 2021/11/28.
//

import Foundation

class ValidSquare {
    func validSquare(_ p1: [Int], _ p2: [Int], _ p3: [Int], _ p4: [Int]) -> Bool {
        if p1 == p2 || p1 == p3 || p1 == p4 || p2 == p3 || p2 == p4 || p3 == p4 {
            return false
        }
        var arr = [Int]()
        arr.append(distanceSquare(p1, p2))
        arr.append(distanceSquare(p1, p3))
        arr.append(distanceSquare(p1, p4))
        arr.append(distanceSquare(p2, p3))
        arr.append(distanceSquare(p2, p4))
        arr.append(distanceSquare(p3, p4))
        arr.sort(by: < )
        guard arr[0] == arr[1] && arr[1] == arr[2] && arr[2] == arr[3] else {
            return false
        }
        guard arr[4] == arr[5] else {
            return false
        }
        return true

    }

    func distanceSquare(_ p1: [Int], _ p2: [Int]) -> Int {
        return (p2[0] - p1[0]) * (p2[0] - p1[0]) + (p2[1] - p1[1]) * (p2[1] - p1[1])
    }

}
