//
//  ToLowerCase.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2021/1/27.
//

import Foundation

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
}
