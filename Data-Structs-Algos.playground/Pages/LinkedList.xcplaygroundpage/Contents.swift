
import Foundation

struct LinkedList<Value> {
 
    var head: Node<Value>?
    var tail: Node<Value>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    init() {
        
    }
    
    // Push adds new value which becomes the new head, old head becomes next
    mutating func push(_ value: Value) {
        
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
        
    }
    
    // Append adds new value at the tail
    mutating func append(_ value: Value) {
        
        // Check to see if the list is empty, if so push the value onto the list
        guard !isEmpty else {
            push(value)
            return
        }
        
        // Create a new node, assign the next variable of the tail to the new node, assign the node to the tail
        let node = Node(value: value)
        tail?.next = node
        tail = node
    }
}

extension LinkedList: CustomStringConvertible {
    
    var description: String {
        guard let head = head else {
            return "Empty List"
        }
        
        return String(describing: head)
    }
}

class Node<Value> {
    
    var value: Value
    var next: Node?
    
    init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node: CustomStringConvertible {
    
    var description: String {
        guard let next = next else {
            return "\(value)"
        }
        
        return "\(value) -> " + String(describing: next) + " "
    }
}

var list = LinkedList<Int>()

list.push(2)
list.push(5)
list.push(17)
list.append(78)

print(list)
//let node1 = Node(value: 1)
//let node2 = Node(value: 2)
//let node3 = Node(value: 3)
//
//node1.next = node2
//node2.next = node3
//
//print(node3)
