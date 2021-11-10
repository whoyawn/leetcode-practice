"""
obvious sort, then get n - kth element -> O(nlogn)

can we do this in O(n)?

1. heapify
2. pump out max k times

kth largest is same as n - k th smallest

[-6, -5, -5, -3, -2, -4, -3, -2, -1]
"""
class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var pq = Heap<Int>(sort: <)
        pq.heapify(from: nums.map { $0 * -1 })
        var kth = 0
        for _ in 0..<k {
            kth = -pq.remove()!
        }
        return kth
    }
}

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