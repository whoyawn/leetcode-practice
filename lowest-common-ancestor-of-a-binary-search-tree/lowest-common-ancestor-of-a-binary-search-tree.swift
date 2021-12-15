/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */
"""
for a given root, any node in left shares root as LCA of all nodes in right

p must be in left or mid, q must be in right or mid

if both < root, go left

if both > root, go right

  2 p = 2 q = 1
1
"""
class Solution {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let root = root, let p = p, let q = q else { return nil }
        if (p.val <= root.val && q.val >= root.val) || (q.val <= root.val && p.val >= root.val) {
            return root
        }
        if p.val <= root.val && q.val <= root.val {
            return lowestCommonAncestor(root.left, p, q)
        } else {
            return lowestCommonAncestor(root.right, p, q)
        }
        return nil
    }
}