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
3,2,1 -> 1,2,3

1,3,2,4 -> 1,2,3,4

swapped values next to each other

swapped values space > 1

1,4,3,2,5

5,2,3,4,1

2 incorrect values -> 1 wrong left, 1 wrong right
1 incorrect value -> next to each other

0. in order traversal
1. hold nodes with incorrect values
 a. 2 arrays with pivots
2. swap
"""
class Solution {
    func recoverTree(_ root: TreeNode?) {
        var nodes: [TreeNode] = []
        inorder(root, &nodes)
        var leftPivot: [TreeNode] = []
        var rightPivot: [TreeNode] = []
        for (i, cur) in nodes.enumerated() where i > 0 {
            let prev = nodes[i - 1]
            if cur.val < prev.val {
                if leftPivot.isEmpty && rightPivot.isEmpty {
                    leftPivot = [prev, cur]
                } else {
                    rightPivot = [prev, cur]   
                }
            }
        }
        // adjacent swap
        if rightPivot.isEmpty {
            swap(&leftPivot[0].val, &leftPivot[1].val)
        } else {
            swap(&leftPivot[0].val, &rightPivot[1].val)
        }
    }
    
    func inorder(_ root: TreeNode?, _ nodes: inout [TreeNode]) {
        guard let root = root else { return }
        inorder(root.left, &nodes)
        nodes.append(root)
        inorder(root.right, &nodes)
    }
}