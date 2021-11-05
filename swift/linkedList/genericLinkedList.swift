// here we use generics to implement a linked list
// this allows us to use any type: String, Int, Obj, etc... 
// when creating a new list.
class Node<T> {
    var value: T
    var next: Node?

    // initialize value using self property
    /* 
      Initialization is the process of preparing an instance of a class, structure, or enum to be used. 
      It involves setting an initial value for each stored property on that instance
    */
    init(value: T, next: Node? = nil) {
        self.value = value
    }
}

// create nodes (without references)
var node1: Node<Int> = Node(value: 3)
var node2: Node<Int> = Node(value: 5)
var node3: Node<Int> = Node(value: 88)

// "link" our nodes together
node1.next = node2
node2.next = node3
node3.next = nil

print(node3.next?.value)
