//
//  ToLowerCase.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2021/1/27.
//

import Foundation

/*
 实现函数 ToLowerCase()，该函数接收一个字符串参数 str，并将该字符串中的大写字母转换成小写字母，之后返回新的字符串。
 */

class ToLowerCase {
    
    func toLowerCase(_ str: String) -> String {
        guard str.count > 0 else {
            return str
        }
        var res = Array(str)
        for c in str {
            var i = c.asciiValue!
            i |= 32
            res.append(Character(UnicodeScalar(i)))
        }
        return String(res)
    }
    
    func toLowerCase10(_ str: String) -> String {
        return String(str.map { Character(UnicodeScalar($0.asciiValue! | 32)) })
    }

    func toLowerCase20(_ str: String) -> String {
        return str.lowercased()
    }
    
    func toLowerCase30(_ str: String) -> String {
        var cArr = [Character]()
        for c in str.unicodeScalars {
            cArr.append(Character(UnicodeScalar(c.value | 32)!))
        }
        return String(cArr)
    }
    
}
