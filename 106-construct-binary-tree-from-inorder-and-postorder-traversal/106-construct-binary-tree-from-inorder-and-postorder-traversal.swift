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
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        var cur = inorder.count - 1
        var inorderDict: [Int:Int] = [:]
        for (i, num) in inorder.enumerated() {
            inorderDict[num] = i
        }
        func modifiedDFS(_ iLeft: Int, _ iRight: Int) -> TreeNode? {
            if iLeft > iRight { return nil }
            let inorderIndex = inorderDict[postorder[cur]]!
            let root = TreeNode(postorder[cur])
            cur -= 1
            root.right = modifiedDFS(inorderIndex + 1, iRight)
            root.left = modifiedDFS(iLeft, inorderIndex - 1)
            return root
        }
        
        return modifiedDFS(0, inorder.count - 1)
    }
}