"""
b -> a

directed graph

topo sort since dag

if there is a topological ordering, then the topo array will be the same size as numCourses as all the courses are seen and ordered once
b.  a
0: [1]

bfs
indegrees 0

2 -> 1

3 ->

1: 0

1: 0
0: 1
"""
class Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var graph: [[Int]] = Array(repeating: [], count: numCourses)
        for p in prerequisites {
            let (a, b) = (p[0], p[1])
            graph[b].append(a)
        }
        var indegrees: [Int] = Array(repeating: 0, count: numCourses)
        for dests in graph {
            for node in dests {
                indegrees[node] += 1
            }
        }
        var sortedOrder: [Int] = []
        
        var queue: [Int] = indegrees.enumerated().filter({ $0.1 == 0 }).map({ $0.0 })
        
        // for i in 0..<indegrees.count {
        //     if indegrees[i] == 0 {
        //         queue.append(i)
        //     }
        // }
        
        while let front = queue.first {
            queue.removeFirst()
            sortedOrder.append(front)
            for node in graph[front] {
                indegrees[node] -= 1
                if indegrees[node] == 0 {
                    queue.append(node)
                }
            }
        }
        
        return sortedOrder.count == numCourses
    }
}