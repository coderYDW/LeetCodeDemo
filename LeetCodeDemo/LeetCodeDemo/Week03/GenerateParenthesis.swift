//
//  GenerateParenthesis.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2020/12/15.
//

import Foundation

class GenerateParenthesis {
    
    func generateParenthesis(_ n: Int) -> [String] {
        var res = [String]()
        generate(0, 0, n, "", &res)
        return res
    }
    
    func generate(_ left: Int, _ right: Int, _ n: Int, _ s: String, _ res: inout [String]) {
        if left == n && right == n {
            res.append(s)
            return
        }
        if left < n {
            generate(left + 1, right, n, s + "(", &res)
        }
        if left > right {
            generate(left, right + 1, n, s + ")", &res)
        }
    }
    
    
}
