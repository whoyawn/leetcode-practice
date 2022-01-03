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

extension TreeNode: Hashable {
    public static func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
        lhs === rhs
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(val)
        hasher.combine(left?.val)
        hasher.combine(right?.val)
    }
}

class Solution {
    func findDuplicateSubtrees(_ root: TreeNode?) -> [TreeNode?] {
        var duplicates: Set<TreeNode> = Set()
	    var subtrees: [String:TreeNode] = [:]
	    inorder(root, &subtrees, &duplicates)
        print(subtrees.keys)
	    return Array(duplicates)
    }

func inorder(_ root: TreeNode?, _ subtrees: inout [String:TreeNode], _ duplicates: inout Set<TreeNode>) -> String {
        guard let root = root else { return "" }
        var key: [String] = []
        key.append("{")
        let left = inorder(root.left, &subtrees, &duplicates)
        if !left.isEmpty {
            key.append(left)
        }
        if root.left == nil && root.right != nil {
            key.append("null")
        }
        key.append(String(root.val))
        if root.left != nil && root.right == nil {
            key.append("null")
        }
        let right = inorder(root.right, &subtrees, &duplicates)

        if !right.isEmpty {
            key.append(right)
        }
        key.append("}")
        
        let string = key.joined(separator: ",")

        if let duplicateRoot = subtrees[string] {
            duplicates.insert(duplicateRoot)
        } else {
            subtrees[string] = root
        }

        return string
    }

}
