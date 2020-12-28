//
//  SqrtX.swift
//  LeetCodeDemo
//
//  Created by Apple on 2020/12/28.
//

import Foundation

class SqrtX {
    
    // MARK: - 二分查找
    
    func mySqrt(_ x: Int) -> Int {
        var left = 0, right = x, res = -1
        while left <= right {
            let mid = (right - left) / 2 + left
            if Int64(mid * mid) <= x {
                res = mid
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return res
    }

    // MARK: - 数学
    
    func mySqrt10(_ x: Int) -> Int {
        if x == 0 {
            return 0;
        }
        let ans = Int64(exp(0.5 * log(Double(x))))
        let temp = pow(Double(ans + 1), 2)
        return Int64(temp) <= x ? Int(ans + 1) : Int(ans)
    }
    
    
    // MARK: - 牛顿迭代法
    
    func mySqrt20(_ x: Int) -> Int {
        if x == 0 {
            return 0;
        }
        let C = Double(x)
        var x0 = Double(x)
        while true {
            let xi = 0.5 * (x0 + C / x0);
            if fabs(x0 - xi) < 1e-7 {
                break;
            }
            x0 = xi;
        }
        return Int(x0);
    }
    
    func mySqrt21(_ x: Int) -> Int {
        var r = Int64(x);
        while r*r > x {
            r = (r + Int64(x)/r) / 2;
        }
        return Int(r);
    }
    

}
