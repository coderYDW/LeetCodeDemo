//
//  TopKFrequent.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2020/12/13.
//

import Foundation

class TopKFrequent {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var dic = [Int: Int]()
        for i in nums {
            dic[i] = (dic[i] ?? 0) + 1
        }
        let a = dic.sorted { $0.1 > $1.1 }
        var res = [Int](repeating: 0, count: k)
        for j in 0..<k {
            res[j] = a[j].key
        }
        return res
    }
}
