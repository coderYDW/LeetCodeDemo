//
//  WordLadderII.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2020/12/27.
//

import Foundation

class WordLadderII {
    
    var wordId = [String: Int]()
    var idWord = [String]()
    var edges = [[Int]]()
    func findLadders(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> [[String]] {
        //将所有单词加入到wordId表中
        var id = 0
        for word in wordList {
            if wordId[word] == nil {
                wordId[word] = id
                idWord.append(word)
                id += 1
            }
        }
        //如果结束词不在单词列表 则无解
        if wordId[endWord] == nil {
            return []
        }
        //开始单词也加入到表格
        if wordId[beginWord] == nil {
            wordId[beginWord] = id
            idWord.append(beginWord)
            id += 1
        }
        //初始化边数组
        edges = [[Int]](repeating: [], count: idWord.count)
        for i in 0..<idWord.count {
            for j in i + 1..<idWord.count {
                //如果两者可以通过转换得到,则建立一条无向边
                if transformCheck(idWord[i], idWord[j]) {
                    edges[i].append(j)
                    edges[j].append(i)
                }
            }
        }
        
        let destination = wordId[endWord] //目的地
        var res = [[String]]() //答案
        var cost = [Int](repeating: Int.max, count: id) //到每个点的代价
        
        //将起点加入队列 并将其cost设置为0
        var queue = [[Int]]() //队列
        var tempBegin = [Int]()
        tempBegin.append(wordId[beginWord]!)
        queue.append(tempBegin)
        cost[wordId[beginWord]!] = 0
        
        //开始广度优先搜索
        while !queue.isEmpty {
            let now = queue.removeFirst()
            let last = now.last
            if last == destination { //如果为终点 直接存到res
                var temp = [String]()
                for i in now {
                    temp.append(idWord[i])
                }
                res.append(temp)
            } else { //不是终点 继续搜索
                for e in edges[last!] {
                    //把代价相同的路径都保留下来
                    if cost[last!] + 1 <= cost[e] {
                        cost[e] = cost[last!] + 1
                        //e和now中的数据加入队列
                        var temp = Array(now)
                        temp.append(e)
                        queue.append(temp)
                    }
                }
            }
        }
        return res
    }
    
    func transformCheck(_ word1: String, _ word2: String) -> Bool {
        var diff = 0
        for i in 0..<word1.count {
            if word2[word2.index(word2.startIndex, offsetBy: i)] != word1[word1.index(word1.startIndex, offsetBy: i)] {
                diff += 1
            }
            if diff >= 2 {
                break
            }
        }
        return diff == 1
    }
    
    func test() {
        let b = "hit"
        let e = "cog"
        let wordList = ["hot","dot","dog","lot","log","cog"]
        print(findLadders(b, e, wordList))
    }
}
