import UIKit

// Linked list

public class Node<Value> {
    
    public var value: Value
    public var next: Node?
    
    public init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node: CustomStringConvertible {
    
    public var description: String {
        guard let next = next else {
            return "\(value)"
        }
        return "\(value) -> " + String(describing: next) + " "
    }
}

public struct LinkedList<Value> {
    
    public var head: Node<Value>?
    public var tail: Node<Value>?
    
    public init() {}
    
    public var isEmpty: Bool {
        head == nil
    }
    
    public mutating func push(_ value: Value) {
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    public mutating func append(_ value: Value) {

      // Empty list uses push
      guard !isEmpty else {
        push(value)
        return
      }
      
      // Create a new node after tail
      tail!.next = Node(value: value)
      
      // New node is now tail
      tail = tail!.next
    }
    
    public func node(at index: Int) -> Node<Value>? {
        
      // New reference to keep track of number of traversals
      var currentNode = head
      var currentIndex = 0
      
      // Move the reference until you have reached the desired index
      while currentNode != nil && currentIndex < index {
        currentNode = currentNode!.next
        currentIndex += 1
      }
      
      return currentNode
    }
    
    @discardableResult
    public mutating func insert(_ value: Value,
                                after node: Node<Value>)
                                -> Node<Value> {
      // Appends if tail
      guard tail !== node else {
        append(value)
        return tail!
      }
      // Link with rest of list and return
      node.next = Node(value: value, next: node.next)
      return node.next!
    }
}

extension LinkedList: CustomStringConvertible {
    
    public var description: String {
        guard let head = head else {
            return "Empty list"
        }
        return String(describing: head)
    }
}

// Example of push
print("---Example of push---")
var list = LinkedList<Int>()
list.push(3)
list.push(2)
list.push(1)

print(list)

print("---Example of append---")
var listAppend = LinkedList<Int>()
listAppend.append(4)
listAppend.append(6)
listAppend.append(1)

print(listAppend)

print("---Example of insert---")
var listInsert = LinkedList<Int>()
listInsert.push(3)
listInsert.push(2)
listInsert.push(1)
  
print("Before inserting: \(listInsert)")
var middleNode = listInsert.node(at: 1)!
    for _ in 1...4 {
    middleNode = listInsert.insert(-1, after: middleNode)
    }
print("After inserting: \(listInsert)")

//// Arrays
//var groceries: [String] = ["apple", "banana", "carros", "olive oil", "avacados"]
//
//print("There are \(groceries.count) items in the groceries array")
//
//for i in 0..<groceries.count {
//    print(groceries[i])
//}
//
//print("the grocery item at index 3 is \(groceries[3])")
//
//groceries.remove(at: 3)
//
//print("There are \(groceries.count) items in the groceries array")
//
//groceries.removeFirst()
//
//print("There are \(groceries.count) items in the groceries array")
//
//groceries.removeLast()
//
//print("There are \(groceries.count) items in the groceries array")
