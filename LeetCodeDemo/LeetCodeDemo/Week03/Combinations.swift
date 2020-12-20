//
//  Combinations.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2020/12/19.
//

import Foundation

class Combinations {
    
    var temp = [Int]()
    var ans = [[Int]]()
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        dfs(1, n, k)
        return ans
    }
    func dfs(_ cur: Int, _ n: Int, _ k: Int) {
        // 剪枝：temp 长度加上区间 [cur, n] 的长度小于 k，不可能构造出长度为 k 的 temp
        if temp.count + (n - cur + 1) < k {
            return
        }
        //记录合法答案
        if temp.count == k {
            ans.append(Array(temp))
            return
        }
        // 考虑选择当前位置
        temp.append(cur)
        dfs(cur + 1, n, k)
        temp.removeLast()
        // 考虑不选择当前位置
        dfs(cur + 1, n, k)
    }
    
}
