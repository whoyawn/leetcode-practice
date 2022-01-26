/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
"""
BFS
record each level
even index - odd integers, increasing
odd index - even integers, decreasing

[1] 0
[10,4] 1
[3,7,9] 2

for even index element:
 check if odd
 check if its greater than the last

"""
class Solution {
    func isEvenOddTree(_ root: TreeNode?) -> Bool {
        guard let root = root else { return false }
        var queue: [TreeNode] = [root]
        var level = 0
        while !queue.isEmpty {
            var prev = level % 2 == 0 ? -1 : Int.max - 1
            for _ in 0..<queue.count {
                let cur = queue.removeFirst()
                if level % 2 == 0 {
                    if !isCorrectEvenLevel(prev, cur.val) {
                        return false
                    }
                } else {
                    if !isCorrectOddLevel(prev, cur.val) {
                        return false
                    }
                }
                if let left = cur.left {
                    queue.append(left)
                }
                if let right = cur.right {
                    queue.append(right)
                }
                prev = cur.val
            }
            level += 1
        }
        return true
    }
    
    func isCorrectEvenLevel(_ prev: Int, _ cur: Int) -> Bool {
        cur % 2 == 1 && cur > prev
    }
    
    func isCorrectOddLevel(_ prev: Int, _ cur: Int) -> Bool {
        cur % 2 == 0 && cur < prev
    }
}