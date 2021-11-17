"""
graph
{0:[1,4]
1:[0, 3]
2:[3]
3:[1,2]
4:[0,5]
5:[4]
}

dag
[
0: [1],
1: [3]
2: [3]
3: []
4: [0,5]
]

1. dfs, keep track of prev
2. if prev -> cur, then changed += 1
O(V) time
O(V+E) space
"""
class Solution {
    func minReorder(_ n: Int, _ connections: [[Int]]) -> Int {
        var graph: [[Int]] = (0..<n).map { _ in [] }
        var dag: [[Int]] = (0..<n).map { _ in [] }
        for c in connections {
            let a = c[0]
            let b = c[1]
            graph[a].append(b)
            graph[b].append(a)
            dag[a].append(b)
        }
        var visited = Set<Int>([0])
        var changed = 0
        dfs(0, &changed, graph, dag, &visited)
        return changed
    }
    
    func dfs(_ cur: Int, _ changed: inout Int, _ graph: [[Int]], _ dag: [[Int]], _ visited: inout Set<Int>) {
        for neighbor in graph[cur] where !visited.contains(neighbor) {
            visited.insert(neighbor)
            if dag[cur].contains(neighbor) {
                changed += 1
            }
            dfs(neighbor, &changed, graph, dag, &visited)
        }
    }
}