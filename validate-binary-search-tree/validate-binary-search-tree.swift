"""
base case: left node < current node, right node > current node
single root is valid -> no child nodes
null root is valid

valid: left is null or < current
right is null or > current



time: O(n), visit node ones
space: keep stack of all the nodes O(n)
"""
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
    func isValidBST(_ root: TreeNode?) -> Bool {
        return validate(root)
    }
    
    func validate(_ root: TreeNode?, _ lower: Int = Int.min, _ upper: Int = Int.max) -> Bool {
        guard let root = root else {
            return true
        }
        if root.val >= upper || root.val <= lower {
            return false
        }
        let l = validate(root.left, lower, root.val)
        let r = validate(root.right, root.val, upper)
        return l && r
    }
}
