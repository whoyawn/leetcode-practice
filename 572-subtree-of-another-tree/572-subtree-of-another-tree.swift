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
traverse root
as soon as root === subRoot, traverse both
  1
1

     1
"""
class Solution {
    func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
        func isMatchingSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
            if root == nil && subRoot == nil { return true }
            let isSameNode = root?.val == subRoot?.val
            return isMatchingSubtree(root?.left, subRoot?.left) && isMatchingSubtree(root?.right, subRoot?.right) && isSameNode
        }
        func findSubRoot(_ node: TreeNode?) -> TreeNode? {
            guard let node = node else { return nil }
            if node.val == subRoot?.val && isMatchingSubtree(node, subRoot) { return node }
            let left = findSubRoot(node.left)
            let right = findSubRoot(node.right)
            return left ?? right
        }

        return findSubRoot(root) != nil
    }
}