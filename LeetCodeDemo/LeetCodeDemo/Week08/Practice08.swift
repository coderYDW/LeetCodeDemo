//
//  Practice08.swift
//  LeetCodeDemo
//
//  Created by Apple on 2021/2/18.
//

import Foundation

class Practice08 {
    
    func heapSort (_ arr: inout [Int]) {
        let n = arr.count - 1
        //建立大顶堆
        buildHeap(&arr, n)
        //交换堆顶和最后一个元素值,最后一个元素是最大值
        //堆化前n - 1个元素值
        //以此类推
        var k = n
        while k > 0 {
            arr.swapAt(k, 0)
            k -= 1
            heapify(&arr, k, 0)
        }
    }
    
    func buildHeap(_ arr: inout [Int], _ n: Int) {
        var i = n / 2 //从非叶子节点开始堆化处理
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
            arr.swapAt(i, maxPos)
            i = maxPos
        }
    }
    
    func quickSort(_ arr: inout [Int], _ left: Int, _ right: Int) {
        if left >= right {
            return
        }
        let pivot = partition(&arr, left, right)
        quickSort(&arr, left, pivot - 1)
        quickSort(&arr, pivot + 1, right)
    }
    
    func partition(_ arr: inout [Int], _ left: Int, _ right: Int) -> Int {
        var pivot = right, counter = left
        for i in left..<right {
            if arr[i] < arr[pivot] {
                arr.swapAt(i, counter)
                counter += 1
            }
        }
        arr.swapAt(pivot, counter)
        return counter
    }
    
    func mergeSort(_ arr: inout [Int], _ left: Int, _ right: Int) {
        if left >= right {
            return
        }
        let mid = (left + right) >> 1
        mergeSort(&arr, left, mid)
        mergeSort(&arr, mid + 1, right)
        merge(&arr, left, mid, right)
    }
    func merge(_ arr: inout [Int], _ left: Int, _ mid: Int, _ right: Int) {
        var temp = [Int]()
        var i = left, j = mid + 1
        while i <= mid && j <= right {
            if arr[i] <= arr[j] {
                temp.append(arr[i])
                i += 1
            } else {
                temp.append(arr[j])
                j += 1
            }
        }
        while i <= mid {
            temp.append(arr[i])
            i += 1
        }
        while j <= right {
            temp.append(arr[j])
            j += 1
        }
        for p in 0..<temp.count {
            arr[left + p] = temp[p]
        }
    }
    
    func test() {
        var arr = [4,5,2,63,1,52,7,9,6]
        //quickSort(&arr, 0, arr.count - 1)
        heapSort(&arr)
        print(arr)
    }
    
}
