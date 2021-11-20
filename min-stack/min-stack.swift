// LinkedList
class MinStack {
    
    class Node {
        let val: Int
        let min: Int
        var prev: Node?
        
        init(_ val: Int,_ min: Int) {
            self.val = val
            self.min = min
        }
    }
    
    var last: Node? = Node(Int.max, Int.max)

    init() {
        
    }
    //              p<-n,l
    // update min [-2, 1]
    func push(_ val: Int) {
        let node = Node(val, min(val, last?.min ?? val))
        node.prev = last
        last = node
    }
    // update new min
    func pop() {
        last = last?.prev
    }
    
    func top() -> Int {
        last?.val ?? Int.max
    }
    
    func getMin() -> Int {
        last?.min ?? Int.max
    }
}

// Array implementation
// class MinStack {
    
//     var minimums: [Int] = []
//     var stack: [Int] = []

//     init() {
        
//     }
//     // update min
//     func push(_ val: Int) {
//         stack.append(val)
//         let lastMinimum = minimums.last ?? val
//         minimums.append(min(lastMinimum, val))
//     }
//     // update new min
//     func pop() {
//         minimums.removeLast()
//         stack.removeLast()
//     }
    
//     func top() -> Int {
//         stack.last ?? 0
//     }
    
//     func getMin() -> Int {
//         minimums.last ?? 0
//     }
// }

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(val)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
 */