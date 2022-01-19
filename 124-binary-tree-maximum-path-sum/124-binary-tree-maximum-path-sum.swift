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
  -10
9      20
    15   7
   1  2 3 -4
/
\
 \
  \
  /
2 paths: left + right + root.val

1 leaf = 1 path
time: O(h*N) where h = height and N is nodes

local max: any subtree with some path
global max: update with local

when you go up, get single path from root
1. left best path, right best path
2. combine, update with root, global max = max(root + left + right, root + left, root + right, root)
3. if the root + best path is > 0, pass up max(best path + root, root)
"""
class Solution {
    func maxPathSum(_ root: TreeNode?) -> Int {
        var globalMax = Int.min
        func dfs(_ root: TreeNode?) -> Int {
            guard let root = root else { return 0 }
            let leftBest = dfs(root.left)
            let rightBest = dfs(root.right)
            let best = max(leftBest, rightBest)
            let withRoot = root.val + best
            globalMax = max(globalMax, root.val + leftBest + rightBest, root.val + leftBest, root.val + rightBest, root.val)
            return withRoot > 0 ? withRoot : max(0, root.val)
        }
        dfs(root)
        return globalMax
    }
}