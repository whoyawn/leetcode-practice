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

because you do it iteratively, there is a problem when you might pop off something on the stack that's
still part of the path

store a sum and a path at each node of the list
"""
class Solution {
    func pathSum(_ root: TreeNode?, _ targetSum: Int) -> [[Int]] {
        var paths: [[Int]] = []
        findPath(root, [], &paths, targetSum)
        return paths
    }
    
    func findPath(_ root: TreeNode?, _ path: [Int], _ paths: inout [[Int]], _ targetSum: Int) {
        guard let root = root else { return }
        var path = path + [root.val]
        if root.left == nil && root.right == nil && targetSum - root.val == 0 {
            paths.append(path)
            return
        }
        findPath(root.left, path, &paths, targetSum - root.val)
        findPath(root.right, path, &paths, targetSum - root.val)
    }
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