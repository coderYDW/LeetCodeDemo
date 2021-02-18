//
//  Practice08.swift
//  LeetCodeDemo
//
//  Created by Apple on 2021/2/18.
//

import Foundation

class Practice08 {
    
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
        quickSort(&arr, 0, arr.count - 1)
        print(arr)
    }
    
}
