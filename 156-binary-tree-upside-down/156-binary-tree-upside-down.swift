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
2

saveLeft -> nextLeft
saveRight -> nextRight
set root left -> prevRoot
set root right -> prevRight
prevRoot = root
prevRight = nextRight
root = nextLeft


                      3  1
          4  5         2
   1       2      -> 5   4
 2  3  ->3   1 
4 5
"""
class Solution {
    func upsideDownBinaryTree(_ root: TreeNode?) -> TreeNode? {
        if root == nil { return nil }
        var prevRoot: TreeNode?
        var prevRight: TreeNode?    
        var cur = root
        var newRoot: TreeNode?
        while cur != nil {
            newRoot = cur
            var nextLeft = cur?.left
            var nextRight = cur?.right
            cur?.left = prevRight
            cur?.right = prevRoot
            prevRoot = cur
            prevRight = nextRight
            cur = nextLeft
        }    
        return newRoot
    }
}