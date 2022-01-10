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
class Solution {
    func verticalOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        var cols: [Int:[Int]] = [:]
        var queue: [(TreeNode, Int)] = [(root, 0)]
        while let popped = queue.first {
            queue.removeFirst()
            let key = popped.1
            let node = popped.0
            cols[key, default: []].append(node.val)
            if let left = node.left {
                queue.append((left, key - 1))
            }
            if let right = node.right {
                queue.append((right, key + 1))
            }
        }

        let minKey = cols.keys.map { Int($0) }.min()!
        let maxKey = cols.keys.map { Int($0) }.max()!
        var output: [[Int]] = []
        for key in minKey...maxKey {
            if let level = cols[key] {
                output.append(level)
            }
        }
        return output
    }
}
