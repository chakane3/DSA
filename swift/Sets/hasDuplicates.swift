/*
Implement the function hasDuplicates in the class DuplicateWordFinder.
Input will be given as a line containing a positive integer n, followed by
n rows, each containing a string. Output should be either the word true
if there are any duplicates among these strings or false if there are not.
Your code should work well on long lists of strings.
*/


import Foundation 
let arrTrue = [3, 3, 5, 6, 22, 3, 8, 9, 7, 76, 5, 46, 43, 12, 1]
let arrFalse = [1, 2, 3, 4, 5]
class DuplicatewordFinder {

    static func hasDuplicates(for arr: Array<Int>) -> Bool {
        var testSet = Set<Int>()
        for element in arr {
            if(testSet.contains(element)) {
                return true
            } else {
                testSet.insert(element)
            }
        }
        return false
    }
}

let result = DuplicatewordFinder.hasDuplicates(for: arrFalse)
print(result)
