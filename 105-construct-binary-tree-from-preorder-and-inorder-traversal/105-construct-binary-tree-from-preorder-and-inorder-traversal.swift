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
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        var inorderDict: [Int:Int] = [:]
        for (i, num) in inorder.enumerated() {
            inorderDict[num] = i
        }
        var cur = 0

        func preorderDFS(_ left: Int, _ right: Int) -> TreeNode? {
            if left > right {
                return nil
            }
            let inorderVal = preorder[cur]
            let inorderIndex = inorderDict[inorderVal]!
            cur += 1
            var val = inorder[inorderIndex]
            let root = TreeNode(val)
            root.left = preorderDFS(left, inorderIndex - 1)
            root.right = preorderDFS(inorderIndex + 1, right)
            return root
        }
        
        return preorderDFS(0, inorder.count - 1)
    }	
}

