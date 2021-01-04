//
//  Fibonacci.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2021/1/3.
//

import Foundation

class Fibonacci {
    
    /*
     总结:
     1.动态规划(最优解) 时间复杂度O(n) 空间复杂度O(1)
     2.递归(带缓存) F(n) = F(n - 1) + F(n - 2),可以添加缓存优化 时间复杂度O(n) 空间复杂度O(n)
     3.矩阵快速幂 时间复杂度O(logn) 空间复杂度O(1)
     4.通项公式 F(n) = 1 / sqrt(5) * [pow((1 + sqrt(5)) / 2, n) + pow((1 - sqrt(5)) / 2, n)] 时间复杂度O(1) 空间复杂度O(1)
     */
    
    
    /*
     斐波那契数列
     
     写一个函数，输入 n ，求斐波那契（Fibonacci）数列的第 n 项。斐波那契数列的定义如下：

     F(0) = 0,   F(1) = 1
     F(N) = F(N - 1) + F(N - 2), 其中 N > 1.

     斐波那契数列由 0 和 1 开始，之后的斐波那契数就是由之前的两数相加而得出。

     答案需要取模 1e9+7（1000000007），如计算初始结果为：1000000008，请返回 1。
     */
    
    //动态规划
    func fib(_ n: Int) -> Int {
        var a = 0, b = 1, sum = 0
        for _ in 0..<n {
            sum = (a + b) % 1000000007
            a = b
            b = sum
        }
        return a
    }
    
    func fib01(_ n: Int) -> Int {
        if n < 2 {
            return n
        }
        var p = 0, q = 1, r = p + q
        for _ in 2..<n {
            p = q
            q = r
            r = (p + q) % 1000000007
        }
        return r
    }
    
    
    
    /*
     斐波那契数
     
     通常用 F(n) 表示，形成的序列称为 斐波那契数列 。该数列由 0 和 1 开始，后面的每一项数字都是前面两项数字的和。也就是：

     F(0) = 0，F(1) = 1
     F(n) = F(n - 1) + F(n - 2)，其中 n > 1

     给你 n ，请计算 F(n) 。
     
     提示：0 <= n <= 30
     */
    
    //动态规划
    func fib200(_ n: Int) -> Int {
        var a = 0, b = 1, sum = 0
        for _ in 0..<n {
            sum = a + b
            a = b
            b = sum
        }
        return a
    }
    
    func fib201(_ n: Int) -> Int {
        if n < 2 {
            return n
        }
        var p = 0, q = 1, r = p + q
        for _ in 2..<n {
            p = q
            q = r
            r = p + q
        }
        return r
    }
    
    //矩阵快速幂
    func fib210(_ n: Int) -> Int {
        let q = [[1, 1], [1, 0]]
        let r = myPow(q, n)
        return r[0][0]
    }
    
    func myPow(_ a: [[Int]], _ n: Int) -> [[Int]] {
        var ret = [[1, 0], [0, 1]]
        while n > 0 {
            if n & 1 == 1 {
                ret = myMultiply(ret, a)
            }
        }
        return ret
    }
    
    func myMultiply(_ a: [[Int]], _ b: [[Int]]) -> [[Int]] {
        var c = [[Int]](repeating: [Int](repeating: 0, count: 2), count: 2);
        for i in 0..<2 {
            for j in 0..<2 {
                c[i][j] = a[i][0] * b[0][j] + a[i][1] * b[1][j];
            }
        }
        return c;
    }
    
    //通项公式
    func dib220(_ n: Int) -> Int {
        let sqrt5 = sqrt(5.0)
        let temp = pow((1.0 + sqrt5) / 2.0, Double(n)) - pow((1.0 - sqrt5) / 2.0, Double(n))
        let res = temp / sqrt5
        return Int(res)
    }
    
    //有限个枚举处理
    func dib230(_ n: Int) -> Int {
        let fibs = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584, 4181, 6765, 10946, 17711, 28657, 46368, 75025, 121393, 196418, 317811, 514229, 832040]
        return fibs[n]
    }
    
    //递归(带缓存)
    var resCache = [Int: Int]()
    func fib240(_ n: Int) -> Int {
        if n < 2 {
            return n
        }
        if resCache[n] != nil {
            return resCache[n]!
        }
        return fib240(n - 1) + fib240(n - 2)
    }
    
}
