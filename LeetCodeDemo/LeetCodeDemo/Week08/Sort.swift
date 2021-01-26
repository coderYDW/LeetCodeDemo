//
//  Sort.swift
//  LeetCodeDemo
//
//  Created by Apple on 2021/1/25.
//

import Foundation

class Sort {
    
    /*
     插入排序：O(n^2) O(1) 稳定
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
     选择排序：O(n^2) O(1) 不稳定
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
     冒泡排序：O(n^2) O(1) 稳定
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
     归并排序: O(nlogn) O(n) 稳定
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
    
    
    /*
     快速排序：O(nlogn) O(nlogn) 不稳定
     1. 从数列中挑出一个元素，称为 “基准”（pivot），
     2. 重新排序数列，所有元素比基准值小的摆放在基准前面，所有元素比基准值大的摆在基准的后面（相同的数可以到任一边）。在这个分区退出之后，该基准就处于数列的中间位置。这个称为分区（partition）操作。
     3. 递归地（recursive）把小于基准值元素的子数列和大于基准值元素的子数列排序。
     */
    func quickSort(_ arr: inout [Int]) {
        quickSortHelper(&arr, 0, arr.count - 1)
    }
    
    func quickSortHelper(_ arr: inout [Int], _ left: Int, _ right: Int) {
        if left >= right {
            return
        }
        let pivot = partition(&arr, left, right)
        quickSortHelper(&arr, left, pivot - 1)
        quickSortHelper(&arr, pivot + 1, right)
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
    
    /*
     堆排序: O(nlogn) O(1) 不稳定
     1. 将初始待排序关键字序列(R1,R2….Rn)构建成大顶堆，此堆为初始的无序区；
     2. 将堆顶元素R[1]与最后一个元素R[n]交换，此时得到新的无序区(R1,R2,……Rn-1)和新的有序区(Rn),且满足R[1,2…n-1]<=R[n]；
     3. 由于交换后新的堆顶R[1]可能违反堆的性质，因此需要对当前无序区(R1,R2,……Rn-1)调整为新堆，然后再次将R[1]与无序区最后一个元素交换，得到新的无序区(R1,R2….Rn-2)和新的有序区(Rn-1,Rn)。不断重复此过程直到有序区的元素个数为n-1，则整个排序过程完成。

     */
    func heapSort(_ arr: inout [Int]) {
        let n = arr.count - 1
        buildHeap(&arr, n)
        var k = n
        while k > 0 {
            arr.swapAt(0, k)
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
            let left = i * 2 + 1
            if left <= n && arr[left] > arr[maxPos] {
                maxPos = left
            }
            let right = i * 2 + 2
            if right <= n && arr[right] > arr[maxPos] {
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
        var arr = [15,2,1,6,7,9,34,5]
        heapSort(&arr)
        print(arr)
    }
    
}
