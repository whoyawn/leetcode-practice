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
Empty tree is height balanced
|left - right subtrees height| <= 1

1. height
2. if left's height and right height, true, also return height

base case:
root is null, true, 0
leaf height is 1

1
  2
    3
"""
class Solution {
    func isBalanced(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        if abs(maxHeight(root.left) - maxHeight(root.right)) <= 1 {
            return isBalanced(root.left) && isBalanced(root.right)
        }
        return false
    }
    
    func maxHeight(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        if root.left == nil && root.right == nil {
            return 1
        }
        let l = maxHeight(root.left)
        let r = maxHeight(root.right)
        return max(l, r) + 1
    }
}