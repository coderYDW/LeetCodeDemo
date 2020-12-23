//
//  LetterOfPhoneNumber.swift
//  LeetCodeDemo
//
//  Created by Apple on 2020/12/22.
//

import Foundation

class LetterOfPhoneNumber {
    /*
     电话号码的字母组合
     ["2": "abc", "3": "def", "4": "ghi", "5": "jkl", "6": "mno", "7": "pqrs", "8": "tuv", "9": "wxyz"]
     */
    func letterCombinations(_ digits: String) -> [String] {
        guard digits.count > 0 else {
            return []
        }
        var res = [String](), temp = ""
        let dic: [Character: String] = ["2": "abc", "3": "def", "4": "ghi", "5": "jkl", "6": "mno", "7": "pqrs", "8": "tuv", "9": "wxyz"]
        func backtrack(_ index: Int) {
            if index == digits.count {
                res.append(temp)
                return
            }
            let str = dic[digits[digits.index(digits.startIndex, offsetBy: index)]]
            for c in str! {
                temp.append(c)
                backtrack(index + 1)
                temp.removeLast()
            }
        }
        backtrack(0)
        return res
    }
}
