//
//  Sort.swift
//  LeetCodeDemo
//
//  Created by Apple on 2021/1/25.
//

import Foundation

class Sort {
    
    /*
     插入排序：
     1. 从第一个元素开始，该元素可以认为已经被排序
     2. 取出下一个元素，在已经排序的元素序列中从后向前扫描
     3. 如果该元素（已排序）大于新元素，将该元素移到下一位置
     4. 重复步骤3，直到找到已排序的元素小于或者等于新元素的位置
     5. 将新元素插入到该位置中
     6. 重复步骤2
     */
    func insertSort(_ arr: inout [Int]) {
        for i in 1..<arr.count {
            let key = arr[i]
            var j = i - 1
            while j >= 0 && arr[j] > key {
                arr[j + 1] = arr[j]
                j -= 1
            }
            arr[j + 1] = key
        }
    }
    
    /*
     选择排序：
     1. 遍历数组，找到最小的元素，将其置于数组起始位置。
     2. 从上次最小元素存放的后一个元素开始遍历至数组尾，将最小的元素置于开始处。
     3. 重复上述过程，直到元素排序完毕。
     */
    func selectionSort(_ arr: inout [Int]) {
        for i in 0..<arr.count {
            var min = i
            for j in i + 1..<arr.count {
                if arr[j] < arr[min] {
                    min = j
                }
            }
            arr.swapAt(i, min)
        }
    }
    
    /*
     冒泡排序：
     1. 比较相邻的元素。如果第一个比第二个大，就交换他们两个，直到把最大的元素放到数组尾部。
     2. 遍历长度减一，对剩下的元素从头重复以上的步骤。
     3. 直到没有任何一对数字需要比较时完成。
     */
    func bubbleSort(_ arr: inout [Int]) {
        for i in 0 ..< arr.count {
            for j in 0 ..< arr.count - 1 - i {
                if arr[j] > arr[j + 1] {
                    arr.swapAt(j, j + 1)
                }
            }
        }
    }
    
    
    /*
     归并排序:
     1. 申请空间，创建两个数组，长度分别为两个有序数组的长度
     2. 设定两个指针，最初位置分别为两个已经排序序列的起始位置
     3. 比较两个指针所指向的元素，选择相对小的元素放入到合并空间，并移动指针到下一位置
     4. 重复步骤3直到某一指针达到序列尾
     5. 将另一序列剩下的所有元素直接复制到合并序列尾
     */
    func mergeSort(_ arr: inout [Int]) {
        mergeSortHelper(&arr, 0, arr.count - 1)
    }
    
    func mergeSortHelper(_ arr: inout [Int], _ left: Int, _ right: Int) {
        if left >= right {
            return
        }
        let mid = (left + right) >> 1
        mergeSortHelper(&arr, left, mid)
        mergeSortHelper(&arr, mid + 1, right)
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
        var arr = [15,2,1,6,7,9,34,5]
        mergeSort(&arr)
        print(arr)
    }
    
    
    
    
    
    
}
