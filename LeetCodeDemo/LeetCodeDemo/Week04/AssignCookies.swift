//
//  AssignCookies.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2020/12/24.
//

import Foundation

class AssignCookies {
    //455. 分发饼干
    func findContentChildren(_ g: [Int], _ s: [Int]) -> Int {
        let gSorted = g.sorted() // 孩子胃口排序
        let sSorted = s.sorted() // 饼干排序
        var res = 0, sIndex = 0
        while sIndex < s.count && res < g.count {
            if sSorted[sIndex] >= gSorted[res]  {
                res += 1
            }
            sIndex += 1
        }
        return res
    }
}
