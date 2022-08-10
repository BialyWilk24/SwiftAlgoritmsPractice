import UIKit

var SortedArray: [Int] = []

for i in 0...150 {
    SortedArray.append(i)
}

var SortedArray2 = [1, 5, 7, 3, 9, 24]

SortedArray.count

func BinarySearch(Array: [Int], Value: Int) -> Int? {
    var low = 0
    var high = Array.count - 1
    while low <= high {
        let mid = (low + high)
        let guess = Array[mid]
        if guess == Value {
            return mid
        }
        if guess > Value {
            high = mid - 1
        } else {
            low = mid + 1
        }
    }
    
    return nil
}

BinarySearch(Array: SortedArray2, Value: 24)
