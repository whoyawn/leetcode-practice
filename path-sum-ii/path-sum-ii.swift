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
paths = []
when hit leaf, check target sum == cur sum, cur path add to paths
leaf: left and right == nil -> base case
store:
cur path
cur sum / cur diff

time: O(n) where n is nodes of tree
space: O(n^2)
"""
class Solution {
    // RECURSIVE
    func pathSum(_ root: TreeNode?, _ targetSum: Int) -> [[Int]] {
        var paths: [[Int]] = []
        var curPath: [Int] = []
        traverse(root, curPath, targetSum, &paths)
        return paths
    }

    func traverse(_ root: TreeNode?, _ curPath: [Int], _ targetSum: Int, _ paths: inout [[Int]]) {
        guard let root = root else { return }
        let newPath = curPath + [root.val]
        let newSum = targetSum - root.val
        traverse(root.left, newPath, newSum, &paths)
        if root.left == nil && root.right == nil && newSum == 0 {
            paths.append(newPath)
        }
        traverse(root.right, newPath, newSum, &paths)
    }
    
    // ITERATIVE
    // func pathSum(_ root: TreeNode?, _ targetSum: Int) -> [[Int]] {
    //     var stack: [(TreeNode, [Int], Int)] = []
    //     var paths: [[Int]] = []
    //     var curPath: [Int] = []
    //     var curSum = 0
    //     var cur = root
    //     var prev: TreeNode?
    //     while !stack.isEmpty || cur != nil {
    //         if cur != nil {
    //             curSum += cur!.val
    //             curPath.append(cur!.val)
    //             stack.append((cur!, curPath, curSum))
    //             // if cur!.left == nil && cur!.right == nil && curSum == targetSum {
    //             //     paths.append(curPath)
    //             // }
    //             cur = cur!.left
    //         } else {
    //             let popped = stack.removeLast()
    //             if popped.0.left == nil && popped.0.right == nil && popped.2 == targetSum {
    //                 paths.append(popped.1)
    //             }
    //             let node = popped.0
    //             curSum = popped.2
    //             curPath = popped.1
    //             cur = node.right
    //         }
    //     }
    //     return paths
    // }
}