//
//  File.swift
//  
//
//  Created by Tuan Hoang on 22/07/2023.
//

import Foundation

// Internal symbols

protocol IHeavyAlgorithm {
    func quickSort(arr: [Int]) -> [Int]
    func mergeSort(arr: [Int]) -> [Int]
}

class HeavyAlgorithm: IHeavyAlgorithm {
    var customTextttttt = "Hello, World!"

    func quickSort(arr: [Int]) -> [Int] {
        let algo = CustomQSAlgorithm(arr: arr)
        algo.quickSort(left: 0, high: arr.count - 1)
        return algo.arr
    }

    func mergeSort(arr: [Int]) -> [Int] {
        let algo = CustomMSAlgorithm(arr: arr)
        algo.mergeSort(left: 0, high: arr.count - 1)
        return algo.arr
    }
}

class CustomQSAlgorithm {
    var arr: [Int]
    init(arr: [Int]) {
        self.arr = arr
    }

    func quickSort(left: Int, high: Int) {
        if left < high {
            var i = left
            var j = high

            while i < j {
                while i < high && arr[i] <= arr[left] {
                    i += 1
                }

                while j > left && arr[j] > arr[left] {
                    j -= 1
                }

                if i < j {
                    arr.swapAt(i, j)
                }
            }
            arr.swapAt(left, j)
            quickSort(left: left, high: j - 1)
            quickSort(left: j + 1, high: high)
        }
    }
}

class CustomMSAlgorithm {
    var arr: [Int]
    init(arr: [Int]) {
        self.arr = arr
    }

    func mergeSort(left: Int, high: Int) {
        debugPrint("Left: \(left) - high: \(high)")
        if left < high {
            let middle = (left + high) / 2
            mergeSort(left: left, high: middle)
            mergeSort(left: middle + 1, high: high)
            merge(left: left, mid: middle, high: high)
        }
    }

    func merge(left: Int, mid: Int, high: Int) {
        var temp: [Int] = []
        var p1 = left
        var p2 = mid + 1

        while p1 <= mid && p2 <= high {
            if arr[p1] < arr[p2] {
                temp.append(arr[p1])
                p1 += 1
            } else {
                temp.append(arr[p2])
                p2 += 1
            }
        }

        while p1 <= mid {
            temp.append(arr[p1])
            p1 += 1
        }

        while p2 <= high {
            temp.append(arr[p2])
            p2 += 1
        }

        for i in left...high {
            arr[i] = temp[i-left]
        }
    }
}
