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
root.val = min(root.left.val, root.right.val)

each val <= than children
each level <= all nodes of lower levels

max heap size 2
"""
class Solution {
    func findSecondMinimumValue(_ root: TreeNode?) -> Int {
        var fakeHeap: [Int] = []
        func dfs(_ root: TreeNode?) {
            guard let root = root else { return }
            if !fakeHeap.contains(root.val) {
                fakeHeap.append(root.val)
            }
            
            if fakeHeap.count > 2 {
                fakeHeap.sort()
                fakeHeap.removeLast()
            }
            dfs(root.left)
            dfs(root.right)
        }
        dfs(root)
        fakeHeap.sort()
        if fakeHeap.count <= 1 || fakeHeap[0] == fakeHeap[1] {
            return -1
        }
        return fakeHeap[1]
    }
}