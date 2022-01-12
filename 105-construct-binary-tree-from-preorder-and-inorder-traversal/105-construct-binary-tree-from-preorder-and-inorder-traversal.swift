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

        func createTree(_ ps: Int, _ pe: Int, _ ins: Int, _ ine: Int) -> TreeNode? {
            if ps > pe { return nil }
                let preorderVal = preorder[ps]
                guard let inorderIndex = inorderDict[preorderVal] else { return nil }
                let root = TreeNode(preorderVal)
                let leftCount = inorderIndex - ins
                root.left = createTree(ps + 1, ps + leftCount, ins, inorderIndex - 1)
                root.right = createTree(ps + leftCount + 1, pe, inorderIndex + 1, ine)

                return root
            }


	    return createTree(0, preorder.count - 1, 0, inorder.count - 1)
    }	
}

