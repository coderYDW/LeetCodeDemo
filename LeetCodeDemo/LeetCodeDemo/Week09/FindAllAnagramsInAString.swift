//
//  FindAllAnagramsInAString.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2021/1/30.
//

import Foundation

class FindAllAnagramsInAString {
    
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        guard s.count >= p.count else {
            return []
        }
        var pf = [Int](repeating: 0, count: 26)
        for c in p.unicodeScalars {
            pf[Int(c.value) - 97] += 1
        }
        let pCnt = p.count
        var res = [Int](), s = Array(s)
        var popLatter: Character? = nil
        for i in 0...s.count - pCnt {
            if s[i + pCnt - 1] == popLatter {
                res.append(i)
                popLatter = s[i]
                continue
            }
            if isAnagrams(String(s[i..<i + pCnt]), pf) {
                res.append(i)
                popLatter = s[i]
            }
        }
        return res
    }
    
    func isAnagrams(_ s: String, _ pf: [Int]) -> Bool {
        var pf = pf
        for c in s.unicodeScalars {
            pf[Int(c.value) - 97] -= 1
            if pf[Int(c.value) - 97] < 0 {
                return false
            }
        }
        for i in pf {
            if i != 0 {
                return false
            }
        }
        return true
    }
    
    
    
    func findAnagrams10(_ s: String, _ p: String) -> [Int] {
        
        //滑动窗口的值,和p的值
        var window = [Character: Int]()
        var needs = [Character: Int]()
        for char in p {
            needs[char, default: 0] += 1
        }
        
        let sArray = Array(s)
        var left = 0, right = 0
        var match = 0 //匹配上的字母数量
        var res = [Int]()
        
        while right < sArray.count {
            let rightChar = sArray[right]
            right += 1
            
            if let needCharCount = needs[rightChar] {
                window[rightChar, default: 0] += 1
                if window[rightChar] == needCharCount {
                    match += 1
                }
            } else {
                continue
            }
            
            while match == needs.count {
                //匹配上的时候如果字符串长度等于P的长度,加入答案
                if right - left == p.count {
                    res.append(left)
                }
                //否者左边向前移动一位
                let leftChar = sArray[left]
                left += 1
                //如果移出去的字符在P中
                if let needCharCount = needs[leftChar] {
                    //如果窗口值和P值相等,match记录减一
                    if window[leftChar] == needCharCount {
                        match -= 1
                    }
                    //窗口值减一
                    window[leftChar]! -= 1
                }
            }
        }
        
        return res
    }
    
    
    func findAnagrams20(_ s: String, _ p: String) -> [Int] {
        let arrs = Array(s)
        let arrp = Array(p)
        let base = Character("a").asciiValue!
        var window = Array(repeating: 0, count: 26)
        var needs = Array(repeating: 0, count: 26)
        var res = [Int]()
        for c in arrp {
            needs[Int(c.asciiValue! - base)] += 1
        }
        var left = 0, right = 0
        while right < arrs.count {
            let curR = Int(arrs[right].asciiValue! - base)
            right += 1
            window[curR] += 1
            while window[curR] > needs[curR] {
                let curL = Int(arrs[left].asciiValue! - base)
                left += 1
                window[curL] -= 1
            }
            if right - left == arrp.count {
                res.append(left)
            }
        }
        return res
    }
    

    
    
    func test() {
        print(findAnagrams20("cba", "abc"))
    }
}
