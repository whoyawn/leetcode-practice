"""
bfs:
1. explore each island as you go out
2. stop when there's a zero
3. go through the grid, everytime you see a 1 then explore entire island
4. to make as visited, then set grid to either 0 or keep an additional matrix that has i,j for visited
"""
class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        var newGrid = grid
        var islands = 0
        for i in 0..<newGrid.count {
            for j in 0..<newGrid[0].count {
                if newGrid[i][j] == "1" {
                    islands += 1
                    bfs(&newGrid, i, j)
                }
            }
        }
        return islands
    }
    
    func bfs(_ grid: inout [[Character]], _ i: Int, _ j: Int) {
        var queue: [(i: Int, j: Int)] = []
        queue.append((i, j))
        while let dequeued = queue.first {
            queue.removeFirst()
            let i = dequeued.i
            let j = dequeued.j
            if (0..<grid.count).contains(i), (0..<grid[0].count).contains(j), grid[i][j] != "0" {
                grid[i][j] = "0"
                let directions = [(0, -1), (0, 1), (-1, 0), (1, 0)]
                for d in directions {
                    queue.append((i + d.0, j + d.1))
                }
            }
        }
    }
}