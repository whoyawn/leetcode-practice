"""
each cell is a height
water can flow if height is lower only left right down up

result needs to be in form [row, col] -> both upper left and bottom left

(row 0 or col 0) and (row m or col n)

for each cell, try to get to the end, end is 
in order to get to the next, next <= cur

base case: hit a 0 or a n/m .. if r = 0 or r = m or c = 0 or c = n

time: O(m*n*(m + n)) space: O(m+n)

should have one in question, the one youre coming from, the current
"""
class Solution {
    func pacificAtlantic(_ heights: [[Int]]) -> [[Int]] {
        let height = heights.count // height
        let width = heights[0].count // width
        print(height, width)
        
        // If can reach island from ocean
        func dfs(_ r: Int, _ c: Int, _ prev: Int, _ visited: inout Set<[Int]>) {
            print(r, c)
            if r < 0 || r >= height || c < 0 || c >= width {
                return
            }
            let cur = heights[r][c]
            
            guard cur >= prev else {
                return
            }

            if !visited.contains([r, c]) {
                visited.insert([r, c])
                dfs(r + 1, c, cur, &visited)
                dfs(r - 1, c, cur, &visited)
                dfs(r, c + 1, cur, &visited)
                dfs(r, c - 1, cur, &visited)
            }
            
            return
        }
        
        var pacific = Set<[Int]>()
        // left
        for r in 0..<height {
            dfs(r, 0, heights[r][0], &pacific)
        }
        // top
        for c in 0..<width {
            dfs(0, c, heights[0][c], &pacific)
        }
        var atlantic = Set<[Int]>()
        // right
        for r in 0..<height {
            dfs(r, width - 1, heights[r][width - 1], &atlantic)
        }
        // bottom
        for c in 0..<width {
            dfs(height - 1, c, heights[height - 1][c], &atlantic)
        }
        
        return Array(pacific.intersection(atlantic))
    }

}
