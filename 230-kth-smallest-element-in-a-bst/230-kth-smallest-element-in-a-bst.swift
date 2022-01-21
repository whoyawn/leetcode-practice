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
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var kth = -1
        var call = k
        func helper(_ root: TreeNode?) {
            guard let root = root, kth < 0 else { return }
            helper(root.left)
            call -= 1
            if call == 0 { 
                kth = root.val
                return
            }
            helper(root.right)
        }
        helper(root)
        return kth
    }
}