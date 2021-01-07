//
//  Practice04.swift
//  LeetCodeDemo
//
//  Created by Apple on 2021/1/6.
//

import Foundation

class Practice04 {
    func minMutation(_ start: String, _ end: String, _ bank: [String]) -> Int {
        let bankSet = Set(bank)
        guard bankSet.contains(end) else {
            return -1
        }
        var step = 0
        var queue = [start], visited: Set = [start]
        while !queue.isEmpty {
            let n = queue.count
            for _ in 0..<n {
                let cur = queue.removeFirst()
                if changeGenetic(cur, end, bankSet, &visited, &queue) {
                    return step + 1
                }
            }
            step += 1
        }
        return step
    }
    
    func changeGenetic(_ cur: String, _ end: String, _ bankSet: Set<String>, _ visited: inout Set<String>, _ queue: inout [String]) -> Bool {
        var charArr = Array(cur)
        for i in 0..<charArr.count {
            let originChar = charArr[i]
            for c in "ACGT" {
                if c == originChar {
                    continue
                }
                charArr[i] = c
                let tempStr = String(charArr)
                if tempStr == end {
                    return true
                }
                if bankSet.contains(tempStr) && !visited.contains(tempStr) {
                    queue.append(tempStr)
                    visited.insert(tempStr)
                }
            }
            charArr[i] = originChar
        }
        return false
    }
    
    func generateParenthesis(_ n: Int) -> [String] {
        var res = [String]()
        generateParenthesisHelper(0, 0, n, &res, "")
        return res
    }
    
    func generateParenthesisHelper(_ left: Int, _ right: Int, _ n: Int, _ res: inout [String], _ s: String) {
        if left == n && right == n {
            res.append(s)
            return
        }
        if left < n {
            generateParenthesisHelper(left + 1, right, n, &res, s + "(")
        }
        if right < left {
            generateParenthesisHelper(left, right + 1, n, &res, s + ")")
        }
    }
    
    struct Location: Hashable {
        var x: Int
        var y: Int
    }
    func robotSim(_ commands: [Int], _ obstacles: [[Int]]) -> Int {
        var obSet = Set<Location>()
        for o in obstacles {
            obSet.insert(Location(x: o[0], y: o[1]))
        }
        var x = 0, y = 0, res = 0, d = 0
        let dx = [0, 1, 0, -1], dy = [1, 0, -1, 0]
        for c in commands {
            if c == -2 {
                d = (d + 3) % 4
            } else if c == -1 {
                d = (d + 1) % 4
            } else {
                for _ in 0..<c {
                    if !obSet.contains(Location(x: x + dx[d], y: y + dy[d])) {
                        x += dx[d]
                        y += dy[d]
                    }
                }
                res = max(res, x * x + y * y)
            }
        }
        return res
    }
    
    
    func nthUglyNumber(_ n: Int) -> Int {
        var dp = [Int](repeating: 0, count: n)
        var a = 0, b = 0, c = 0
        for i in 0..<n {
            dp[i] = min(dp[a] * 2, dp[b] * 3, dp[c] * 5)
            if dp[i] == dp[a] * 2 {
                a += 1
            }
            if dp[i] == dp[b] * 3 {
                b += 1
            }
            if dp[i] == dp[c] * 5 {
                c += 1
            }
        }
        return dp[n - 1]
    }
    
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        var inorderDict = [Int: Int]()
        for (i, v) in inorder.enumerated() {
            inorderDict[v] = i
        }
        return buildTreeHelper(preorder, inorder, 0, preorder.count - 1, 0, preorder.count - 1, inorderDict)
    }
    
    func buildTreeHelper(_ preorder: [Int], _ inorder: [Int], _ preLeft: Int, _ preRight: Int, _ inLeft: Int, _ inRight: Int, _ inorderDict: [Int: Int]) -> TreeNode? {
        if preLeft > preRight {
            return nil
        }
        let root = TreeNode(preorder[preLeft])
        let rootIndex = inorderDict[preorder[preLeft]]!
        let size = rootIndex - inLeft
        root.left = buildTreeHelper(preorder, inorder, preLeft + 1, preLeft + size, inLeft, rootIndex - 1, inorderDict)
        root.right = buildTreeHelper(preorder, inorder, preLeft + size + 1, preRight, rootIndex + 1, inRight, inorderDict)
        return root
    }
    
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else {
            return []
        }
        var res = [[Int]]()
        var queue = [root]
        while !queue.isEmpty {
            let n = queue.count
            var levelTemp = [Int]()
            for _ in 0..<n {
                let node = queue.removeFirst()
                levelTemp.append(node.val)
                if node.left != nil {
                    queue.append(node.left!)
                }
                if node.right != nil {
                    queue.append(node.right!)
                }
            }
            res.append(levelTemp)
        }
        return res
    }
    
    func mySqrt(_ x: Int) -> Int {
        var r = x
        while r * r > x {
            r = (r + x / r) / 2
        }
        return r
    }
    
    func isPerfectSquare(_ num: Int) -> Bool {
        var r = num
        while r * r > num {
            r = (r + num / r) / 2
        }
        return r * r == num
    }
}
