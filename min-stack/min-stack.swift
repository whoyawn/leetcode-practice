
class MinStack {
    
    var minimums: [Int] = []
    var stack: [Int] = []

    init() {
        
    }
    // update min
    func push(_ val: Int) {
        stack.append(val)
        let lastMinimum = minimums.last ?? val
        minimums.append(min(lastMinimum, val))
    }
    // update new min
    func pop() {
        minimums.removeLast()
        stack.removeLast()
    }
    
    func top() -> Int {
        stack.last ?? 0
    }
    
    func getMin() -> Int {
        minimums.last ?? 0
    }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(val)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
 */