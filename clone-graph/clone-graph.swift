/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var neighbors: [Node?]
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.neighbors = []
 *     }
 * }
 */
"""
[[2,4],[1,3],[2,4],[1,3]]


{1: [2,4]
O(n + m)
O(n)
"""

class Solution {
    func cloneGraph(_ node: Node?) -> Node? {
        return bfs(node)
    }
    
    func bfs(_ node: Node?) -> Node? {
        guard let node = node else { return nil }
        var queue: [Node] = [node]
        var visited: [Int: Node] = [:]
        visited[node.val] = Node(node.val)
        
        while let dequeued = queue.first {
            queue.removeFirst()
            for neighbor in dequeued.neighbors {
                // make sure you haven't visited (not yet cloned)
                guard let neighbor = neighbor else { continue }
                if visited[neighbor.val] == nil {
                    queue.append(neighbor)
                }
                let clonedNeighbor = visited[neighbor.val] ?? Node(neighbor.val)
                visited[neighbor.val] = clonedNeighbor
                let clonedCur = visited[dequeued.val]!
                clonedCur.neighbors.append(clonedNeighbor)
            }
        }
        return visited[node.val]!
    }
//     func cloneGraph(_ node: Node?) -> Node? {
//         var nodes: [Int: Node] = [:]
//         var visited = Set<Node>()
//         guard let node = node else { return nil }
//         let newNode = Node(node.val)
//         nodes[1] = newNode
//         visited.insert(newNode)
//         dfs(node, &visited, &nodes)
//         return nodes[1]!
//     }
    
//     func dfs(_ node: Node?, _ visited: inout Set<Node>, _ nodes: inout [Int: Node]) {
//         guard let node = node else { return }
//         let cur = nodes[node.val]!
//         cur.neighbors = node.neighbors.compactMap { neighbor in
//             guard let neighbor = neighbor else { return nil }
//             let existingNeighbor = nodes[neighbor.val] ?? Node(neighbor.val)
//             nodes[neighbor.val] = existingNeighbor
//             return existingNeighbor
//         }
//         for neighbor in node.neighbors {
//             if let neighbor = neighbor, !visited.contains(neighbor) {
//                 visited.insert(neighbor)
//                 dfs(neighbor, &visited, &nodes)
//             }
//         }
//     }
}