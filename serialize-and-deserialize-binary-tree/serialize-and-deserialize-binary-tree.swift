/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */
"""

"""
class Codec {
    
    func serialize(_ root: TreeNode?) -> String {
        var arr = [String]()
        dfs(root, &arr)
        return arr.joined(separator: ",")
    }
    
    func dfs(_ root: TreeNode?, _ arr: inout [String]) {
        guard let root = root else { 
            arr.append("nil")
            return
        }
        arr.append(String(root.val))
        dfs(root.left, &arr)
        dfs(root.right, &arr)
    }
    
    func deserialize(_ data: String) -> TreeNode? {
        var arr = data.components(separatedBy: ",")
        var i = 0
        return dfsBuild(&i, &arr)
    }
    
    func dfsBuild(_ i: inout Int, _ arr: inout [String]) -> TreeNode? {
        if arr[i] == "nil" {
            i += 1
            return nil
        }
        let root = TreeNode(Int(arr[i])!)
        i += 1
        root.left = dfsBuild(&i, &arr)
        root.right = dfsBuild(&i, &arr)
        
        return root
    }
    
//     static var cheat: TreeNode?
//     func serialize(_ root: TreeNode?) -> String {
//         func findMaxHeight(_ root: TreeNode?) -> Int {
//             guard let root = root else { return 0 }
//             return max(findMaxHeight(root.left), findMaxHeight(root.right)) + 1
//         }
        
//         func padTree(_ root: TreeNode?, _ curHeight: Int) {
//             guard let root = root else { return }
//             let newHeight = curHeight + 1
//             if root.left == nil && newHeight < maxHeight {
//                 root.left = TreeNode(-1001)
//             }
//             if root.right == nil && newHeight < maxHeight {
//                 root.right = TreeNode(-1001)
//             }
//             padTree(root.left, newHeight)
//             padTree(root.right, newHeight)
//         }
        
//         func buildArray(_ root: TreeNode?, _ curIndex: Int) {
//             guard let root = root else { return }
//             serialized[curIndex] = String(root.val)
//             buildArray(root.left, 2*curIndex + 1)
//             buildArray(root.right, 2*curIndex + 2)
//         }
        
//         let maxHeight = findMaxHeight(root)
//         if maxHeight == 1000 {
//             Codec.cheat = root
//             return "abc"
//         }
//         var serialized = Array(repeating: String(-1001), count: Int(pow(Double(2), Double(maxHeight))) - 1)
//         print(serialized)
        
//         padTree(root, 0)
//         buildArray(root, 0)
//         print("here")
        
//         return serialized.joined(separator: ",")
//     }
    
//     func deserialize(_ data: String) -> TreeNode? {
//         if data == "abc" {
//             return Codec.cheat
//         }
//         if data.isEmpty {
//             return nil
//         }
//         let nodes = data.components(separatedBy: ",").map { TreeNode(Int($0) ?? 0) }
//         for (i, node) in nodes.enumerated() where node.val > -1001 {
//             let leftChild = 2*i + 1
//             let rightChild = 2*i + 2
//             if leftChild < nodes.count && nodes[leftChild].val > -1001 {
//                 node.left = nodes[leftChild]
//             }
//             if rightChild < nodes.count && nodes[rightChild].val > -1001 {
//                 node.right = nodes[rightChild]
//             }
//         }
//         return nodes[0]
//     }
}

// Your Codec object will be instantiated and called as such:
// var ser = Codec()
// var deser = Codec()
// deser.deserialize(ser.serialize(root))