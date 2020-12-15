//
//  FizzBuzz.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2020/12/10.
//

import Foundation

class FizzBuzz {
    
    func fizzBuzz(_ n: Int) -> [String] {
        var res = [String]()
        let dic = [3: "Fizz", 5: "Buzz"]
        for i in 1...n {
            var string = ""
            for key in dic.keys.sorted(by: <) {
                if i % key == 0 {
                    string.append(dic[key]!)
                }
            }
            if string == "" {
                string.append(String(i))
            }
            res.append(string)
        }
        return res
    }
    
    func fizzBuzz01(_ n: Int) -> [String] {
        var res = [String]()
        for i in 1...n {
            var string = ""
            if i % 3 == 0 {
                string.append("Fizz")
            }
            if i % 5 == 0 {
                string.append("Buzz")
            }
            if string == "" {
                string.append(String(i))
            }
            res.append(string)
        }
        return res
    }
    
    func fizzBuzz02(_ n: Int) -> [String] {
        var res = [String]()
        for i in 1...n {
            var string = ""
            if i % 3 == 0 && i % 5 == 0 {
                string.append("FizzBuzz")
            } else if i % 3 == 0 {
                string.append("Fizz")
            } else if i % 5 == 0 {
                string.append("Buzz")
            }
            if string == "" {
                string.append(String(i))
            }
            res.append(string)
        }
        return res
    }
}
