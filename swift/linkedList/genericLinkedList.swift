/* 
    here we use generics to implement a linked list
    this allows us to use any type: String, Int, Obj, etc... 
    when creating a new list.

    Initialize value using self property
    Initialization is the process of preparing an instance of a class, structure, or enum to be used. 
    It involves setting an initial value for each stored property on that instance.

    Swift initializers dont return a value, however, they ensure that new instances of a type are correctly 
    initialized before theyre used for the first time. 

    We use self.value to assign our value to the instance of our class

    ex.) Int implementation                             |    ex.) Int Array implementation
    class Node<T> {                                     |    class Node<Array> {   
        var value: T                                    |        var value: [Array]
        var next: Node?                                 |        var next: Node?
                                                        |                                 
        init(value: T, next: Node? = nil) {             |        init(value: [Array], next: Node? = nil) {
            self.value = value                          |            self.value = value
        }                                               |        }
    }                                                   |    }
                                                        |  
    // create nodes (without references)                |    // create nodes without references
    var node1: Node<Int> = Node(value: 3)               |    var node1: Node<Int> = Node(value: [1, 2, 3], next: nil)
    var node2: Node<Int> = Node(value: 5)               |    var node2: Node<Int> = Node(value: [4, 5, 6], next: nil)
    var node3: Node<Int> = Node(value: 88)              |    var node3: Node<Int> = Node(value: [2], next: nil)
                                                        |
    // "link" our nodes together                        |    // link nodes together
    node1.next = node2                                  |    node1.next = node2
    node2.next = node3                                  |    node2.next = node3
    node3.next = nil                                    |
 */
import Foundation
/*
  In this next node implementation we have our generic conform to Equatable and Node itself conforms to 
  CustomStringConvertible and Equatable
  Types that conform to equatable can be compared for equality using ==, !=

  if we populate soime nodes and use:
  let node1: Node<Int> = Node(value: 55)
  let node2: Node<Int> = Node(value: 1)
  node1.next = node2

  we would be able to use node.description to get this result: 55 -> 1 -> nil
  if we use node.value we just return the value of that node

  ex.)
  extension StreetAddress: Equatable {
        static func == (lhs: StreetAddress, rhs: StreetAddress) -> Bool {
            return
                lhs.number == rhs.number &&
                lhs.street == rhs.street &&
                lhs.unit == rhs.unit
        }
    }

    let addresses = [StreetAddress("1490", "Grove Street"),
                 StreetAddress("2119", "Maple Avenue"),
                 StreetAddress("1400", "16th Street")]
    let home = StreetAddress("1400", "16th Street")

    print(addresses[0] == home)
    // Prints "false"

    print(addresses.contains(home))
    // Prints "true"


    CustomStringConvertible is a protocol that provides a type to be represented as a string. 

    ex.)
    struct Point {
    let x: Int, y: Int
    }

    let p = Point(x: 21, y: 30)
    print(p)
    // Prints "Point(x: 21, y: 30)"

    extension Point: CustomStringConvertible {
        var description: String {
            return "(\(x), \(y))"
        }
    }

    print(p)
    // Prints "(21, 30)"
*/

class Node<T: Equatable>: CustomStringConvertible, Equatable {
    public var value: T
    public var next: Node?

    // conform to CustomStringConvertible
    var description: String {
        guard let next = next else { return "\(value) -> nil"}
        return "\(value) -> \(next)"
    }

    // conform to Equatable
    static func ==(lhs: Node, rhs: Node) -> Bool {
        return lhs.value == rhs.value && lhs.next == rhs.next
    }

    init(value: T) {
        self.value = value
    }
}

class LinkedList<T: Equatable>: CustomStringConvertible {
    private var head: Node<T>?
    private var tail: Node<T>?

    var description: String {
        guard let head = head else {return "empty list"}
        return "\(head)"
    }

    public var first: Node<T>? {
        return head
    }

    public var last: Node<T>? {
        return tail
    }

    public var isEmpty: Bool {
        return head == nil
    }

    /*
    Append 
      1. Create a new node
      2. Check if we have an element already existing, if so, the next reference will be assigned to our new node
         if not, head is set to our new node
      3. set the tail to the newNode
    */
    public func append(_ value: T) {
        let newNode = Node(value: value)
        if let lastNode = tail {
            lastNode.next = newNode
        } else {
            head = newNode
        }
        tail = newNode
    }


    /*
    Remove Last Node
    1. Check if our list is empty
    2. Create a space for our removed node
    3. Check if we have 1 element only in the list
        a. Our removed node equals head (since its only 1 element in the list)
        b. Set the "head" and "tail" to nil, emptying out the array

    4. Create space to hold our head as "currentNode" 
    5. While currentNode is not nil, iterate through the array
        a. If that currentNode's reference to next node is the tail
            a. Our removed node is set to the  current node's next reference
            b. the current nodes next reference is  set to nil
            c. the tail is now the second to last node from the origional list. 

        b. if our current node is nil, we move to the next node. 


    ex.)
        Iterate the list until the current node's next is the tail. 
        [2 -> 3 -> 4 -> 5 -> nil]

        removedNode = 5
        currentNode.next = nil
        tail = currentNode (in this case, 4 is our new tail)
        [2 -> 3 -> 4 -> 5 -> nil]

        result 
        [2 -> 3 -> 4 -> nil]
        
    */
    public func removeLast() -> Node<T>? {
        guard !isEmpty else {return nil}
        var removedNode: Node<T>?
        if head == tail {
            removedNode = head
            head = nil
            tail = nil
        }

        var currentNode = head
        while currentNode != nil {
                if currentNode?.next == tail {
                    removedNode = currentNode?.next
                    currentNode?.next = nil
                    tail = currentNode
                }
                currentNode = currentNode?.next
        }
        return removedNode
    }


    /*
    ReverseList O(n)
    1. Create pointers for our list
        a. current is set to head
        b. "next" is the reference to the right of head
        c. "prev" is assumed to be nil before we iterate (because its left of head)

    2. Iterate through the list
        a. set next as the next node
        b. set the next of our current to prev (node on the left side)
        c. the prev is set to current (as to shift prev to the right)
        d. the current node is now set to the next node. 



    ex.)    2 -> 3 -> 4 -> 5-> nil  |   |   |   |   |   |  rtn
                current = head      | 2 | 3 | 4 | 5 |nil|
                next = head.next    | 3 | 3 | 4 | 5 |nil|
                prev = Node<T>      |nil| 2 | 3 | 4 | 5 |
                current.next        | X |nil| 2 | 3 | 4 |

                ** we keep adding on to prev as our new returned list
        
                returns: 5 -> 4 -> 3 -> 2 -> 1 -> nil
    */
    public func reverseLinkedList() -> Node<T>? {
        guard !isEmpty else {return nil}
        var current = head  // create a pointer for the current node were looking at
        var next = head?.next // create a pointer for the next node from the head
        var prev: Node<T>? // create a pointer for the previous node

        // iterate through the node
        while current != nil {
            next = current?.next
            current?.next = prev
            prev = current
            current = next
        }

        return prev
    }
}

var singlyLinkedList = LinkedList<Int>()
singlyLinkedList.append(1)
singlyLinkedList.append(2)
singlyLinkedList.append(3)
singlyLinkedList.append(4)
singlyLinkedList.append(5)
singlyLinkedList.append(6)
singlyLinkedList.append(7)
// print(singlyLinkedList.description)
// singlyLinkedList.removeLast()
// print(singlyLinkedList.description)
let result1 = singlyLinkedList.description
print("original list: \(result1)\n")

let result2 = singlyLinkedList.reverseLinkedList()
print("\nreversed list: \(result2?.description)")
