class Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var digraph: [[Int]] = (0..<numCourses).map { _ in [] } 
        var indegrees: [Int:Int] = [:]
        for edge in prerequisites {
            let start = edge[0]
            let end = edge[1]
            digraph[start].append(end)
        }
        for node in digraph {
            for neighbor in node {
                indegrees[neighbor, default: 0] += 1
            }
        }
        
        var nodesWithoutEdges: [Int] = []
        for node in 0..<digraph.count {
            if indegrees[node, default: 0] == 0 {
                nodesWithoutEdges.append(node)
            }
        }
        
        var ordering: [Int] = []
        
        while let popped = nodesWithoutEdges.last {
            nodesWithoutEdges.removeLast()
            ordering.append(popped)
            for neighbor in digraph[popped] {
                indegrees[neighbor]! -= 1
                if indegrees[neighbor] == 0 {
                    nodesWithoutEdges.append(neighbor)
                }
            }
        }
        
        return ordering.count == numCourses
    }
}