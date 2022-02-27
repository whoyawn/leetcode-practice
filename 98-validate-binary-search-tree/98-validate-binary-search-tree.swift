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
inorder -> sorted
check prev as your go, if cur <= prev then false, else true
"""
class Solution {
    func isValidBST(_ root: TreeNode?) -> Bool {
        var isValid = true
        var prev: TreeNode?
        func dfs(_ root: TreeNode?) {
            guard let root = root else { return }
            dfs(root.left)
            if root.val <= prev?.val ?? Int.min { 
                isValid = false
                return
            }
            prev = root
            dfs(root.right)
        }
        dfs(root)
        return isValid
    }
}