"""
dfs from all cells
(m*n)*(m*n)

dfs continue only if adjc is greater
"""
class Solution {
    func pacificAtlantic(_ heights: [[Int]]) -> [[Int]] {
        let (rows, cols) = (heights.count, heights[0].count)
        var pacific = (0..<rows).map { _ in Array(repeating: 0, count: cols)}
        var atlantic = pacific

        func dfs(_ matrix: inout [[Int]], _ row: Int, _ col: Int) {
            matrix[row][col] = 1
            for d in [(0, -1), (0, 1), (1, 0), (-1, 0)] {
                let (newRow, newCol) = (row + d.0, col + d.1)
                if newRow < 0 || newRow >= rows || newCol < 0 || newCol >= cols { continue }
                if matrix[newRow][newCol] == 1 || heights[newRow][newCol] < heights[row][col] { continue }
                dfs(&matrix, newRow, newCol)
            }
        }
        for row in 0..<rows {
            dfs(&pacific, row, 0)
            dfs(&atlantic, row, cols - 1)
        }
        for col in 0..<cols {
            dfs(&pacific, 0, col)
            dfs(&atlantic, rows - 1, col)
        }
        
        var flowables: [[Int]] = []

        for row in 0..<rows {
            for col in 0..<cols {
                if pacific[row][col] + atlantic[row][col] == 2 {
                    flowables.append([row, col])
                }
            }
        }
        return flowables
    }
}