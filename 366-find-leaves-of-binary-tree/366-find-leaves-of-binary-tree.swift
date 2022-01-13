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
Each array is one level
leaf node: node in which both children are null
how to remove node? parent.child = null
   1-3
2- 2. 3-1
4 5.  
1 1

inorder: [4,2,5,1,3]
level -> key: maxHeight, val: node
1. get maxHeight of each node
2. collect them into arrays of levels
3. return the collection
"""
class Solution {
    func findLeaves(_ root: TreeNode?) -> [[Int]] {
        var levels: [Int:[Int]] = [:]
        func collectHeights(_ root: TreeNode?) -> Int {
            guard let root = root else { return 0 }
            let leftHeight = collectHeights(root.left)
            let rightHeight = collectHeights(root.right)
            let maxHeight = max(leftHeight, rightHeight) + 1
            levels[maxHeight, default: []].append(root.val)
            return maxHeight
        }
        _ = collectHeights(root)
        var output: [[Int]] = []
        for i in 1..<levels.count+1 {
            output.append(levels[i]!)
        }
        return output
    }
}