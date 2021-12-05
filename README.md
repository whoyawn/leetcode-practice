# leetcode-practice
Collection of LeetCode questions to ace the coding interview! - Created using [LeetHub](https://github.com/QasimWani/LeetHub).

# Algorithms/Patterns used

## Topological sort

```
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

```
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

```
// problems that use heaps: k closest elements
// heap implementation. heaps are a complete binary tree so all the levels are filled except for the bottom right
// finding the min -> O(1)
// inserting -> O(log n) since there are log n levels
// dequeuing -> O(log n) since you bubble log n times

struct Heap<T> {
    var elements = [T]()
    
    var isEmpty: Bool { return elements.isEmpty }
    var count: Int { return elements.count }
    var isOrdered: (T, T) -> Bool
    
    public init(sort: @escaping (T, T) -> Bool) {
        self.isOrdered = sort
    }
    
    mutating func heapify(from array: [T]) {
        elements = array
        for i in stride(from: (elements.count/2 - 1), through: 0, by: -1) {
            heapifyDown(index: i, heapSize: elements.count)
        }
    }
    
    mutating func insert(value: T) {
        self.elements.append(value)
        
        heapifyUp(index: self.elements.count - 1)
    }
    
    public mutating func remove(at index: Int = 0) -> T? {
        let temp: T
        
        if index < 0 && count - 1 <= index {
            return nil
        }
        temp = elements[index]
        elements[index] = elements[count - 1]
        elements.removeLast()
        shiftDown()
        return temp
    }
    
    mutating func heapifyUp(index: Int) {
        var nodeIndex = index
        
        while true {
            let parentIndex = self.parentOf(nodeIndex)
            
            var first = parentIndex
            if parentIndex >= 0 && isOrdered(elements[nodeIndex], elements[first]) {
                first = nodeIndex
            }
            if first == parentIndex { return }
            
            elements.swapAt(parentIndex, first)
            nodeIndex = first
        }
    }
    
    mutating func heapifyDown(index: Int, heapSize: Int) {
        var parentIndex = index
        
        while true {
            let leftIndex = self.leftOf(parentIndex)
            let rightIndex = leftIndex + 1
            
            var first = parentIndex
            if leftIndex < heapSize && isOrdered(elements[leftIndex], elements[first]) {
                first = leftIndex
            }
            if rightIndex < heapSize && isOrdered(elements[rightIndex], elements[first]) {
                first = rightIndex
            }
            if first == parentIndex { return }
            
            elements.swapAt(parentIndex, first)
            parentIndex = first
        }
    }

    mutating func shiftDown() {
        heapifyDown(index: 0, heapSize: elements.count)
    }

    
    func parentOf(_ index: Int) -> Int {
            return (index - 1) / 2
    }
    
    func leftOf(_ index: Int) -> Int {
        return (2 * index) + 1
    }
    
    func rightOf(_ index: Int) -> Int {
        return (2 * index) + 2
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
