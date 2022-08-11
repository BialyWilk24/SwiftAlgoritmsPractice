import UIKit


var array: [Int] = []
var array2 = [0, 9, 8, 7, 6, 5, 4, 3, 2, 1]

for _ in 0...25 {
    array.append(Int.random(in: 0..<25))
}
array

func bubbleSort<T: Comparable>(_ Array: inout [T]) -> [T] {
    let len = Array.count - 1
    for i in 0...len {
        for j in 0..<(len - i) {
            if Array[j] > Array[j + 1] {
                let temp = Array[j]
                Array[j] = Array[j + 1]
                Array[j + 1] = temp
            }
        }
    }
    return Array
}

func insertionSort<T: Comparable>(_ Array: inout [T]) -> [T] {
    let len = Array.count - 1
    for i in 0...len {
        var currentIndex = i
        let temp = Array[currentIndex]
        while currentIndex > 0 && temp < Array[currentIndex - 1] {
            Array[currentIndex] = Array[currentIndex - 1]
            currentIndex -= 1
        }
        Array[currentIndex] = temp
    }
    return Array
}

//MergeSort
func mergeSort(_ array:[Int]) -> [Int] {
    guard array.count > 1 else {
        return array
    }
    let middleIndex = array.count / 2
    let leftArray = mergeSort(Array(array[0..<middleIndex]))
    let rightArray = mergeSort(Array(array[middleIndex..<array.count]))
    
    return merge(leftArray, rightArray)
    
}

func merge(_ left: [Int], _ right: [Int]) -> [Int] {
    var leftIndex = 0
    var rightIndex = 0
    var orderedArray: [Int] = []
    
    while leftIndex < left.count && rightIndex < right.count {
        let leftElement = left[leftIndex]
        let rightElement = right[rightIndex]
        
        if leftElement < rightElement {
            orderedArray.append(leftElement)
            leftIndex += 1
        } else if leftElement > rightElement {
            orderedArray.append(rightElement)
            rightIndex += 1
        } else {
            orderedArray.append(leftElement)
            leftIndex += 1
            orderedArray.append(rightElement)
            rightIndex += 1
        }
    }
    
    while leftIndex < left.count {
        orderedArray.append(left[leftIndex])
        leftIndex += 1
    }
    
    while rightIndex < right.count {
        orderedArray.append(right[rightIndex])
        rightIndex += 1
    }
    return orderedArray
}//MergeSort

//QuickSort
func quickSort(_ Array: inout [Int], _ low: Int, _ high: Int) {
    if low < high {
        let prePivot = quckSortNode(&Array, low, high)
        quickSort(&Array, low, prePivot - 1)
        quickSort(&Array, prePivot + 1, high)
    }
}

func quckSortNode(_ Array: inout [Int], _ low: Int, _ high: Int) -> Int{
    var low = low
    var high = high
    let pivot = Array[low]
    
    while low < high {
        while low < high && Array[high] >= pivot {
            high -= 1
        }
        Array[low] = Array[high]
        
        while low < high && Array[low] <= pivot {
            low += 1
        }
        Array[high] = Array[low]
    }
    Array[low] = pivot
    
    return low
    
}//QuickSort

//bubbleSort(&array2)
//insertionSort(&array2)
//mergeSort(array2)
//quickSort(&array2, 0, array2.count - 1)

