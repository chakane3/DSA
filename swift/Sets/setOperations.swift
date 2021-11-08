import Foundation

class SetOperations {

    // O(1) -
    static func findUnion(setObj set1: Set<Int>, setObj set2: Set<Int>) -> Set<Int> {
        // works similar to just throwing both set into an array
        // then iterating over that array to see if our result set contains any elements in the array
        return set1.union(set2)
    }
}

let set1: Set<Int> = [3, 2, 4, 1]
let set2: Set<Int> = [5, 3, 99, 1]
let result = SetOperations.findUnion(setObj: set1, setObj: set2)
print(result)
