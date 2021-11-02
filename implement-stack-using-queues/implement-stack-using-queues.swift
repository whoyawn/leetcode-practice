"""
stack: t[2,1]b <- carrier queue

queue: b[]t <- operation queue

space: O(n)
push: O(1) time
pop: O(n) time
top: O(n) time
"""

class Deque<T> {
    init() {}
    var array = Array<T>()
    func prepend(_ e: T) {
        array.append(e)
    }
    func popFirst() -> T {
        let val = array[0]
        array.removeFirst()
        return val
    }
    var count: Int {
        array.count
    }
    var isEmpty: Bool {
        array.isEmpty
    }
}

class MyStack {
    
    var carrier = Deque<Int>()
    var operations = Deque<Int>()

    init() {}
    
    func push(_ x: Int) {
        carrier.prepend(x)
        print(carrier.array, operations.array)
    }
    
    func pop() -> Int {
        while carrier.count > 1 {
            operations.prepend(carrier.popFirst())
        }
        let popped = carrier.popFirst()
        (carrier, operations) = (operations, carrier)
        return popped
    }
    
    func top() -> Int {
        while carrier.count > 1 {
            operations.prepend(carrier.popFirst())
        }
        let popped = carrier.popFirst()
        operations.prepend(popped)
        (carrier, operations) = (operations, carrier)
        return popped
    }
    
    func empty() -> Bool {
        return carrier.isEmpty && operations.isEmpty
    }
}

/**
 * Your MyStack object will be instantiated and called as such:
 * let obj = MyStack()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Bool = obj.empty()
 */