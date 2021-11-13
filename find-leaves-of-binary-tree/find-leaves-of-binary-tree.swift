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
parent
leaf
1. collect leaves + parent
2. remove laeves
3. repeat

leaf: left and right are null
parent -> if it has a child, and the child satifies leaf condition


    1
 2    3
4

parents = [1]

no leaves -> left is null and right is null
"""
class Solution {
    func findLeaves(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        var allLeaves: [[Int]] = []
        var parents: [TreeNode] = []
        var queue: [TreeNode] = [root]
        let top = root
        while !(top.left == nil && top.right == nil) {
            while !queue.isEmpty {
                let popped = queue.removeLast()
                if let l = popped.left {
                    queue.append(l)
                    if isLeaf(l) {
                        parents.append(popped)
                    }
                }
                if let r = popped.right {
                    queue.append(r)
                    if isLeaf(r) {
                        if parents.last !== popped {
                            parents.append(popped)
                        }
                    }
                }
            }
            var leaves: [Int] = []
            for parent in parents {
                if let l = parent.left, isLeaf(l) {
                    leaves.append(l.val)
                    parent.left = nil
                }
                if let r = parent.right, isLeaf(r) {
                    leaves.append(r.val)
                    parent.right = nil
                }
            }
            allLeaves.append(leaves)
            parents = []
            queue.append(root)
        }
        allLeaves.append([top.val])
        return allLeaves
    }
    
    func isLeaf(_ node: TreeNode) -> Bool {
        return node.left == nil && node.right == nil
    }
}