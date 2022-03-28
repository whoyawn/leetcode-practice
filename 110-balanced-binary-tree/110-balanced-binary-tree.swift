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
    func isBalanced(_ root: TreeNode?) -> Bool {
        var balanced = true
        func height(_ root: TreeNode?) -> Int {
            guard let root = root else { return 0 }
            let l = height(root.left)
            let r = height(root.right)
            if abs(l - r) > 1 {
                balanced = false
                return 0
            }
            return max(l, r) + 1
        }
        _ = height(root)
        return balanced
    }
}