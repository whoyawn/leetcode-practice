"""
1 2 3 4 -> 4 3 2 1
count
[123]

0
[3 12]

queue: FIFO
"""
class MyStack {
    
    var queue: [Int] = []

    init() {
        
    }
    
    func push(_ x: Int) {
        queue.append(x)
    }
    // O(n) deletes
    func pop() -> Int {
        var loops = queue.count - 1
        while loops > 0 {
            queue.append(queue.removeFirst())
            loops -= 1
        }
        return queue.removeFirst()
    }
    // O(n) pushes back
    func top() -> Int {
        var loops = queue.count - 1
        while loops > 0 {
            queue.append(queue.removeFirst())
            loops -= 1
        }
        let first = queue.first!
        queue.append(queue.removeFirst())
        return first
    }
    
    func empty() -> Bool {
        queue.isEmpty
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