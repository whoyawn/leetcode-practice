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
root - to - leaf

top down dfs

curSum

Time: O(n)
Space: O(log n)
 1
2
"""
class Solution {
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        guard let root = root else {
            return false
        }
        return add(root, 0, targetSum)
    }
    
    func add(_ root: TreeNode?, _ curSum: Int, _ targetSum: Int) -> Bool {
        guard let root = root else {
            return false
        }
        let newSum = curSum + root.val
        if root.left == nil && root.right == nil {
            return newSum == targetSum
        }
        return add(root.left, newSum, targetSum) || add(root.right, newSum, targetSum)
    }
}