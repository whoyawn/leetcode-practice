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
    var graph: [Int:[Int]] = [:]
    var directions: [String:Character] = [:]
    var visited: Set<Int> = Set()
    var output: String = ""
    
    func getDirections(_ root: TreeNode?, _ startValue: Int, _ destValue: Int) -> String {
        buildGraph(root, nil, "D")
        var path: [Character] = []
        findEnd(startValue, destValue, &path)
        return self.output
    }

	func findEnd(_ curValue: Int, _ destValue: Int, _ path: inout [Character]) {
		if visited.contains(curValue) {
			return
        }
		if curValue == destValue {
			self.output = String(path)
            return
            }
		self.visited.insert(curValue)
		for neighbor in self.graph[curValue]! {
			let direction = self.directions["\(curValue)->\(neighbor)"]!
            path.append(direction)
			findEnd(neighbor, destValue, &path)
            path.removeLast()
    }
}

	func buildGraph(_ root: TreeNode?, _ prev: TreeNode?, _ direction: Character) {
		guard let root = root else { return }
		if let prev = prev {
			self.graph[prev.val, default: []].append(root.val)
			self.graph[root.val, default: []].append(prev.val)
			self.directions["\(prev.val)->\(root.val)"] = direction
			self.directions["\(root.val)->\(prev.val)"] = "U"
        }
		buildGraph(root.left, root, "L")
		buildGraph(root.right, root, "R")
    }
}
