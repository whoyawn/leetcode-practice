"""
path = [i, ni, ...]
stop: get to n-1...if i == n-1
bfs / dfs
pathi[0] = 0
Runtime: O(P)
Space: O(V*V)
"""
class Solution {
    func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
        var output: [[Int]] = []
        dfs(graph, 0, [0], &output)
        return output
    }
    
    func dfs(_ graph: [[Int]], _ cur: Int, _ path: [Int], _ output: inout [[Int]]) {
        if cur == graph.count - 1 {
            output.append(path)
            return
        }
        for neighbor in graph[cur] {
            dfs(graph, neighbor, path + [neighbor], &output)
        }
    }
}