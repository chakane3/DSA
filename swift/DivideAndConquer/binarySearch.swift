import Foundation

public class BinarySearch {
    static func binarySearch(for arr: Array<Int>, target: Int) -> Bool {
        var upperBound = arr.count-1
        var lowerBound = 0
        while lowerBound <= upperBound {
            let midPoint = upperBound - lowerBound / 2
            print(midPoint)
            if arr[midPoint] > target {
                upperBound = midPoint - 1
            } else if arr[midPoint] < target {
                lowerBound = midPoint + 1
            } else {
                return true
            }
        }
        return false
    }
}

let arr = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]
let target = 15
let result = BinarySearch.binarySearch(for: arr, target: target)
print(result)
