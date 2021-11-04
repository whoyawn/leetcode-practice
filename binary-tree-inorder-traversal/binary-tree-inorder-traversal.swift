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


"""
class Solution {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var arr = [Int]()
        traverse(root, &arr)
        return arr
    }
    
    func traverse(_ node: TreeNode?, _ arr: inout [Int]) {
        guard let node = node else {
            return
        }
        traverse(node.left, &arr)
        arr.append(node.val)
        traverse(node.right, &arr)
    }
}