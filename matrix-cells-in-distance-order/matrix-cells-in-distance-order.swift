"""
distance |r1 - r2| + |c1 - c2|

3 x 3

[0,0,0]
[0,X,0]
[0,0,0]


[X,0] -> [[0,0],[0,1]]

000
001

[[0,1],[0,0],[1,1],[1,0]]

BFS
8 directional
visited

0000
0000
0100

01
00
"""
class Solution {
    func allCellsDistOrder(_ rows: Int, _ cols: Int, _ rCenter: Int, _ cCenter: Int) -> [[Int]] {
        let start = [rCenter, cCenter]
        var visited = Set<[Int]>([start])
        var queue: [[Int]] = [start]
        var sortedDistance = [start]
        let directions = [(-1, 0), (0, -1), (0, 1), (1, 0)]
        while !queue.isEmpty {
            let popped = queue.removeFirst()
            for d in directions {
                var newCoordinate = [popped[0] + d.0, popped[1] + d.1]
                if (0..<rows).contains(newCoordinate[0]) && (0..<cols).contains(newCoordinate[1]) && !visited.contains(newCoordinate) {
                    queue.append(newCoordinate)
                    visited.insert(newCoordinate)
                    sortedDistance.append(newCoordinate)
                }
            }
        }
        return sortedDistance
    }
        
}