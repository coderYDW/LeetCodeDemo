//
//  LeaderBoard.swift
//  LeetCodeDemo
//
//  Created by Yangdongwu on 2021/1/24.
//

import Foundation

/*
 新一轮的「力扣杯」编程大赛即将启动，为了动态显示参赛者的得分数据，需要设计一个排行榜 Leaderboard。

 请你帮忙来设计这个 Leaderboard 类，使得它有如下 3 个函数：

     addScore(playerId, score)：
         假如参赛者已经在排行榜上，就给他的当前得分增加 score 点分值并更新排行。
         假如该参赛者不在排行榜上，就把他添加到榜单上，并且将分数设置为 score。
     top(K)：返回前 K 名参赛者的 得分总和。
     reset(playerId)：将指定参赛者的成绩清零。题目保证在调用此函数前，该参赛者已有成绩，并且在榜单上。

 请注意，在初始状态下，排行榜是空的。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/design-a-leaderboard
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Leaderboard {

    var array = [[Int]](repeating: [Int](), count: 12000)
    var index = 0
    
    init() {
        
    }
    
    func addScore(_ playerId: Int, _ score: Int) {
        var arrT = [Int](repeating: 0, count: 2)
        arrT[0] = playerId; arrT[1] = score
        var pot = search(playerId)
        if pot == -1 {
            pot = index
        }
        insert(arrT, pot)
    }
    
    func insert(_ arrT: [Int], _ pot: Int) {
        var i = pot, arrT = arrT
        if pot != index {
            arrT[1] = array[pot][1] + arrT[1]
        }
        if index != 0 {
            i = pot
            while i > 0 && arrT[1] > array[i - 1][1] {
                array[i] = array[i - 1]
                i -= 1
            }
        }
        array[i] = arrT
        if pot == index {
            index += 1
        }
    }
    
    func top(_ K: Int) -> Int {
        let tempIndex = K > index ? index : K
        var sum = 0
        for i in 0..<tempIndex {
            sum += array[i][1]
        }
        return sum
    }
    
    func reset(_ playerId: Int) {
        let ret = search(playerId)
        var orign = array[ret]
        orign[1] = 0
        for i in ret + 1..<index {
            array[i - 1] = array[i]
        }
        array[index - 1] = orign
    }
    
    func search(_ playId: Int) -> Int {
        for i in 0..<index {
            if array[i].first == playId {
                return i
            }
        }
        return -1
    }
}

/**
 * Your Leaderboard object will be instantiated and called as such:
 * let obj = Leaderboard()
 * obj.addScore(playerId, score)
 * let ret_2: Int = obj.top(K)
 * obj.reset(playerId)
 */
