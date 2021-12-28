# leetcode-practice
Collection of LeetCode questions to ace the coding interview! - Created using [LeetHub](https://github.com/QasimWani/LeetHub).

# Algorithms/Patterns used

## Topological sort

```swift
// Problems that use top sort: course schedule i/ii
// https://www.interviewcake.com/concept/swift/topological-sort
    func topologicalSort(_ vertices: Int, _ edgeList: [[Int]]) -> [Int]? {
        // digraph is a dictionary where key are nodes and values are the adjacent neighboring nodes
        // sometimes you may only have the edge list, like `let graph = [[0, 1], [1, 2], [1, 3], [2, 3]]`
        var digraph: [[Int]] = (0..<vertices).map { _ in [] }
        var indegrees: [Int:Int] = [:]
        for edge in edgeList {
            let start = edge[0]
            let end = edge[1]
            digraph[start].append(end)
        }
        // construct dictionary mapping nodes to indegrees
        for node in digraph {
            for neighbor in node {
                indegrees[neighbor, default: 0] += 1
            }
        }
        // track nodes with no incoming edges
        var nodesWithoutEdges: [Int] = []
        for node in 0..<digraph.count {
            if indegrees[node, default: 0] == 0 {
                nodesWithoutEdges.append(node)
            }
        }
        // initially, no nodes in our ordering
        var ordering: [Int] = []
        // as long as there are nodes with no incoming edges
        // that can be added to the ordering
        while let popped = nodesWithoutEdges.last {
            // add one of those nodes to the ordering
            nodesWithoutEdges.removeLast()
            ordering.append(popped)
            
            // decrement the indegree of that node's neighbors
            for neighbor in digraph[popped] {
                indegrees[neighbor]! -= 1
                if indegrees[neighbor] == 0 {
                    nodesWithoutEdges.append(neighbor)
                }
            }
        }
        // we've run out of nodes with no incoming edges
        // did we add all the nodes or find a cycle?
        if ordering.count == digraph.count {
            return ordering
        } else {
            return nil
        }
    }
```

## Disjoint Set and Union Find

```swift
/// Maintain a parent array where parent[i] is the parent node i in the forest
///
/// Roots have themselves as parent. That's hwo we know we reached the root
///
///```
///     1         4
///   0   2    5   3
/// parent = [1, 1, 1, 4, 4, 4]
/// index:    0  1  2  3  4  5
/// ```
/// space: O(n)
/// union and find both take α(n) = 4 amortized time (ackermann)
/// Just path compression (no union by size) each operation is log(n)
class DisjointSet {
    
    var parent = [Int]()
    var size = [Int]()
    
    init(size: Int) {
        parent = (0..<size).map { $0 }
        self.size = Array(repeating: 1, count: size)
    }
    
    func makeSet() {
        
    }
    
    func union(_ first: Int, _ second: Int) {
        let rootFirst = find(first)
        let rootSecond = find(second)
        guard rootFirst != rootSecond else { return }
        // union by size
        if size[rootFirst] < size[rootSecond] {
            parent[rootFirst] = rootSecond
            size[rootSecond] += size[rootFirst] // don't care about the size of rootFirst anymore because it's no longer a root
        } else {
            parent[rootSecond] = rootFirst
            size[rootFirst] += size[rootSecond]
        }

        print(parent)
    }
    
    /// With path-compression, each operation takes amortized O(log n) time. First find the root. Then go back down and set each node you found as the child of the the root
    func find(_ node: Int) -> Int {
        var root = parent[node]
        // while you're not at the top (root == itself)
        while root != parent[root] {
            root = parent[root]
        }
        // path compression, update every node in the path
        var nodeToCompress = node
        while parent[nodeToCompress] != root {
            let immediateParent = parent[nodeToCompress]
            parent[nodeToCompress] = root
            nodeToCompress = immediateParent
        }
        print("parent of \(node): \(root)")
        return root
    }
}

let set = DisjointSet(size: 8)
set.union(0, 1)
set.union(0, 2)
set.find(0)
set.find(7)
```

## Heap

```swift
// problems that use heaps: k closest elements
// heap implementation. heaps are a complete binary tree so all the levels are filled except for the bottom right
// finding the min -> O(1)
// inserting -> O(log n) since there are log n levels
// dequeuing -> O(log n) since you bubble log n times

//
//  Heap.swift
//  Written for the Swift Algorithm Club by Kevin Randrup and Matthijs Hollemans
//

public struct Heap<T> {
  
  /** The array that stores the heap's nodes. */
  var nodes = [T]()
  
  /**
   * Determines how to compare two nodes in the heap.
   * Use '>' for a max-heap or '<' for a min-heap,
   * or provide a comparing method if the heap is made
   * of custom elements, for example tuples.
   */
  private var orderCriteria: (T, T) -> Bool
  
  /**
   * Creates an empty heap.
   * The sort function determines whether this is a min-heap or max-heap.
   * For comparable data types, > makes a max-heap, < makes a min-heap.
   */
  public init(sort: @escaping (T, T) -> Bool) {
    self.orderCriteria = sort
  }
  
  /**
   * Creates a heap from an array. The order of the array does not matter;
   * the elements are inserted into the heap in the order determined by the
   * sort function. For comparable data types, '>' makes a max-heap,
   * '<' makes a min-heap.
   */
  public init(array: [T], sort: @escaping (T, T) -> Bool) {
    self.orderCriteria = sort
    configureHeap(from: array)
  }
  
  /**
   * Configures the max-heap or min-heap from an array, in a bottom-up manner.
   * Performance: This runs pretty much in O(n).
   */
  private mutating func configureHeap(from array: [T]) {
    nodes = array
    for i in stride(from: (nodes.count/2-1), through: 0, by: -1) {
      shiftDown(i)
    }
  }
  
  public var isEmpty: Bool {
    return nodes.isEmpty
  }
  
  public var count: Int {
    return nodes.count
  }
  
  /**
   * Returns the index of the parent of the element at index i.
   * The element at index 0 is the root of the tree and has no parent.
   */
  @inline(__always) internal func parentIndex(ofIndex i: Int) -> Int {
    return (i - 1) / 2
  }
  
  /**
   * Returns the index of the left child of the element at index i.
   * Note that this index can be greater than the heap size, in which case
   * there is no left child.
   */
  @inline(__always) internal func leftChildIndex(ofIndex i: Int) -> Int {
    return 2*i + 1
  }
  
  /**
   * Returns the index of the right child of the element at index i.
   * Note that this index can be greater than the heap size, in which case
   * there is no right child.
   */
  @inline(__always) internal func rightChildIndex(ofIndex i: Int) -> Int {
    return 2*i + 2
  }
  
  /**
   * Returns the maximum value in the heap (for a max-heap) or the minimum
   * value (for a min-heap).
   */
  public func peek() -> T? {
    return nodes.first
  }
  
  /**
   * Adds a new value to the heap. This reorders the heap so that the max-heap
   * or min-heap property still holds. Performance: O(log n).
   */
  public mutating func insert(_ value: T) {
    nodes.append(value)
    shiftUp(nodes.count - 1)
  }
  
  /**
   * Adds a sequence of values to the heap. This reorders the heap so that
   * the max-heap or min-heap property still holds. Performance: O(log n).
   */
  public mutating func insert<S: Sequence>(_ sequence: S) where S.Iterator.Element == T {
    for value in sequence {
      insert(value)
    }
  }
  
  /**
   * Allows you to change an element. This reorders the heap so that
   * the max-heap or min-heap property still holds.
   */
  public mutating func replace(index i: Int, value: T) {
    guard i < nodes.count else { return }
    
    remove(at: i)
    insert(value)
  }
  
  /**
   * Removes the root node from the heap. For a max-heap, this is the maximum
   * value; for a min-heap it is the minimum value. Performance: O(log n).
   */
  @discardableResult public mutating func remove() -> T? {
    guard !nodes.isEmpty else { return nil }
    
    if nodes.count == 1 {
      return nodes.removeLast()
    } else {
      // Use the last node to replace the first one, then fix the heap by
      // shifting this new first node into its proper position.
      let value = nodes[0]
      nodes[0] = nodes.removeLast()
      shiftDown(0)
      return value
    }
  }
  
  /**
   * Removes an arbitrary node from the heap. Performance: O(log n).
   * Note that you need to know the node's index.
   */
  @discardableResult public mutating func remove(at index: Int) -> T? {
    guard index < nodes.count else { return nil }
    
    let size = nodes.count - 1
    if index != size {
      nodes.swapAt(index, size)
      shiftDown(from: index, until: size)
      shiftUp(index)
    }
    return nodes.removeLast()
  }
  
  /**
   * Takes a child node and looks at its parents; if a parent is not larger
   * (max-heap) or not smaller (min-heap) than the child, we exchange them.
   */
  internal mutating func shiftUp(_ index: Int) {
    var childIndex = index
    let child = nodes[childIndex]
    var parentIndex = self.parentIndex(ofIndex: childIndex)
    
    while childIndex > 0 && orderCriteria(child, nodes[parentIndex]) {
      nodes[childIndex] = nodes[parentIndex]
      childIndex = parentIndex
      parentIndex = self.parentIndex(ofIndex: childIndex)
    }
    
    nodes[childIndex] = child
  }
  
  /**
   * Looks at a parent node and makes sure it is still larger (max-heap) or
   * smaller (min-heap) than its childeren.
   */
  internal mutating func shiftDown(from index: Int, until endIndex: Int) {
    let leftChildIndex = self.leftChildIndex(ofIndex: index)
    let rightChildIndex = leftChildIndex + 1
    
    // Figure out which comes first if we order them by the sort function:
    // the parent, the left child, or the right child. If the parent comes
    // first, we're done. If not, that element is out-of-place and we make
    // it "float down" the tree until the heap property is restored.
    var first = index
    if leftChildIndex < endIndex && orderCriteria(nodes[leftChildIndex], nodes[first]) {
      first = leftChildIndex
    }
    if rightChildIndex < endIndex && orderCriteria(nodes[rightChildIndex], nodes[first]) {
      first = rightChildIndex
    }
    if first == index { return }
    
    nodes.swapAt(index, first)
    shiftDown(from: first, until: endIndex)
  }
  
  internal mutating func shiftDown(_ index: Int) {
    shiftDown(from: index, until: nodes.count)
  }
  
}

// MARK: - Searching

extension Heap where T: Equatable {
  
  /** Get the index of a node in the heap. Performance: O(n). */
  public func index(of node: T) -> Int? {
    return nodes.index(where: { $0 == node })
  }
  
  /** Removes the first occurrence of a node from the heap. Performance: O(n). */
  @discardableResult public mutating func remove(node: T) -> T? {
    if let index = index(of: node) {
      return remove(at: index)
    }
    return nil
  }
  
}


let array: [Int] = [12,3,6,15,45,1,2]
var heap = Heap<Int>(sort: { lhs, rhs in
    return abs(lhs - 15) < abs(rhs - 15)
})
heap.heapify(from: array)
heap.insert(value: 23)
print(heap.elements)
print(heap.remove(at: 0))
print(heap.elements)

```

## Backtracking

Key concepts:
- Conceptually is a DFS
- Implementation-wise, we need to manage global state
- Algorithm design: modeling the search space and pruning

```swift
func balancedString(s) {

    func backtracking() {
        ...
        state.append() // transform global state to child state
        backtracking()
        state.removeLast() // undo transformation
    }
}

func matrix() {
    curHead = head
    
    head = neighbor
    visited[neighbor.0][neighbor.1] = true
    numVisited += 1
    
    backtracking()
    
    head = curHead
    visited[neighbor.0][neighbor.1] = false
    numVisited -= 1
}
```
