"""
[1,1]
[1,2]
[1,3]
1. fill out base values (right and down)
2. take value from top and left, add it to current
3. repeat until you hit bottom right
"""
class Solution {
    // DP
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var grid = (0..<m).map { _ in Array(repeating: 0, count: n) }
        grid[0][0] = 1
        for col in 0..<n {
            grid[0][col] = 1
        }
        for row in 0..<m {
            grid[row][0] = 1
        }
        for row in 0..<grid.count {
            for col in 0..<grid[row].count {
                if grid[row][col] == 0 {
                    if col - 1 >= 0 && row - 1 >= 0 {
                        grid[row][col] = grid[row - 1][col] + grid[row][col - 1]
                    }
                }
            }
        }
        return grid[m - 1][n - 1]
    }
    
    // TOP DOWN
}