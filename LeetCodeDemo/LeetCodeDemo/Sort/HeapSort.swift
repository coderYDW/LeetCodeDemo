//
//  HeapSort.swift
//  LeetCodeDemo
//
//  Created by Apple on 2021/2/19.
//

import Foundation

class HeapSort {
    func heapSort(_ arr: inout [Int]) {
        //建立大顶堆
        let n = arr.count - 1
        buildHeap(&arr, n)
        //交换堆顶和最后一个值,除了最后一个最大值,其余堆化
        var k = n
        while k > 0 {
            arr.swapAt(k, 0)
            k -= 1
            heapify(&arr, k, 0)
        }
    }
    
    func buildHeap(_ arr: inout [Int], _ n: Int) {
        var i = n / 2
        while i >= 0 {
            heapify(&arr, n, i)
            i -= 1
        }
    }
    
    func heapify(_ arr: inout [Int], _ n: Int, _ i: Int) {
        var i = i
        while true {
            var maxPos = i
            let left = 2 * i + 1
            if left <= n && arr[maxPos] < arr[left] {
                maxPos = left
            }
            let right = 2 * i + 2
            if right <= n && arr[maxPos] < arr[right] {
                maxPos = right
            }
            if maxPos == i {
                break
            }
            arr.swapAt(maxPos, i)
            i = maxPos
        }
    }
    
    func test() {
        var arr = [1,23,4,56,7,89]
        heapSort(&arr)
        print(arr)
    }
}
