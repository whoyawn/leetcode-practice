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
left, root, right

going down, add left until hit a null

hit null -> pop back up stack, then go down another "stack" for the right side

 1
2 3

[2,1,3]
[
"""
class Solution {
//     func inorderTraversal(_ root: TreeNode?) -> [Int] {
//         var arr = [Int]()
//         traverse(root, &arr)
//         return arr
//     }
    
//     func traverse(_ node: TreeNode?, _ arr: inout [Int]) {
//         guard let node = node else {
//             return
//         }
//         traverse(node.left, &arr)
//         arr.append(node.val)
//         traverse(node.right, &arr)
//     }
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var node: TreeNode? = root
        var inorder: [Int] = []
        var stack: [TreeNode] = []
        while !stack.isEmpty || node != nil {
            if node != nil {
                stack.append(node!)
                node = node!.left
            } else {
                let popped = stack.removeLast()
                inorder.append(popped.val)
                node = popped.right
            }
        }
        return inorder
    }
}