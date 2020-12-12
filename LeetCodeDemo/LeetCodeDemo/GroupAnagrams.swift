//
//  GroupAnagrams.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2020/12/12.
//

import Foundation

class GroupAnagrams {
    
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var hashMap = [String: [String]]()
        for str in strs {
            let key = String(str.sorted())
            if hashMap[key] == nil {
                hashMap[key] = []
            }
            hashMap[key]!.append(str)
        }
        return Array(hashMap.values)
    }
    
    func test(_ strs: [String]) {
        let result = groupAnagrams(strs)
        print(result)
    }
}
