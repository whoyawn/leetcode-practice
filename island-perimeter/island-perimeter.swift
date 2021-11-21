/**
valid perimeter = one of the borders are water/out of bounds
-> l, r, u, d -> +1 each
1. loop throuugh grid
2. dfs
 a. count perimeters
 b. visited set
3. return perimeter
*/
class Solution {
    func islandPerimeter(_ grid: [[Int]]) -> Int {
        var perimeter = 0
        var visited = Set<[Int]>()
        for row in 0..<grid.count {
            for col in 0..<grid[0].count {
                if grid[row][col] == 1 {
                    dfs(grid, &visited, &perimeter, [row, col])
                }
            }
        }
        return perimeter
    }
    
    func dfs(_ grid: [[Int]], _ visited: inout Set<[Int]>, _ perimeter: inout Int, _ cur: [Int]) {
        let row = cur[0]
        let col = cur[1]
        if !(0..<grid.count).contains(row) || !(0..<grid[0].count).contains(col) || grid[row][col] == 0 || visited.contains(cur) {
            return
        }
        visited.insert(cur)
        let directions = [(0, 1), (0, -1), (1, 0), (-1, -0)]
        for d in directions {
            let newCellRow = cur[0] + d.0
            let newCellCol = cur[1] + d.1
            if !(0..<grid.count).contains(newCellRow) || !(0..<grid[0].count).contains(newCellCol) {
                perimeter += 1
            } else if grid[newCellRow][newCellCol] == 0 {
                perimeter += 1
            }
            dfs(grid, &visited, &perimeter, [newCellRow, newCellCol])
        }
    }
}