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
    /// BFS
    func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        var queue: [TreeNode] = [root]
        var sum = 0
        while !queue.isEmpty {
            let popped = queue.removeFirst()
            print(popped.val)
            if let l = popped.left {
                sum += (l.left == nil && l.right == nil) ? l.val : 0
                queue.append(l)
            }
            if let r = popped.right {
                queue.append(r)
            }
        }
        return sum
    }
    
    /// Iteratively
    // func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
    //     var sum = 0
    //     var stack: [TreeNode] = []
    //     var node = root
    //     while !stack.isEmpty || node != nil {
    //         if node != nil {
    //             stack.append(node!)
    //             if let l = node!.left {
    //                 sum += (l.left == nil && l.right == nil) ? l.val : 0
    //             }
    //             node = node?.left
    //         } else {
    //             let popped = stack.removeLast()
    //             node = popped.right
    //         }
    //     }
    //     return sum
    // }
   
        /// Recursively
//     func traverse(_ root: TreeNode?, _ sum: inout Int) {
//         guard let root = root else { return }
        
//         if let l = root.left {
//             sum += l.val
//         }
//         traverse(root.left, &sum)
//         traverse(root.right, &sum)
//     }
}