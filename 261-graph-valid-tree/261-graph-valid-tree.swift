"""
tree = each node has child or not, children don't go back up
no cycle
tree = special directed acyclic graph where root = 1

7 8 9
  0
1 2 3
4 5 6

DFS, skip prev, if you see a visited node, cycle

0: [1,2,3]
1: [0, 4]
2: [0]
3: [0]
4: [1]

0: [1]
1: [0]
2: [3]
3: [2]

0 1
2 3
"""
class Solution {
    func validTree(_ n: Int, _ edges: [[Int]]) -> Bool {
        var visited: Set<Int> = Set()
        var graph: [[Int]] = Array(repeating: [], count: n)
        for edge in edges {
            graph[edge[0]].append(edge[1])
            graph[edge[1]].append(edge[0])
        }
        func dfs(_ cur: Int, _ prev: Int) -> Bool {
            if visited.contains(cur) {
                return false
            }
            visited.insert(cur)
            for neighbor in graph[cur] where neighbor != prev {
                let valid = dfs(neighbor, cur)
                if !valid {
                    return false
                }
            }
            return true
        }
        return dfs(0, -1) && visited.count == n
    }
}