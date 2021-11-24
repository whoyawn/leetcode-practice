"""
[
[1], 1
[1,1], 2
[1,2,1], 3 
[1,3,3,1], 4
[1,4,6,4,1]] 5

n >= 1

"""
class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        var rows = [[1]]
        if numRows == 1 {
            return rows
        }
        for row in 1..<numRows {
            var newRow = [1]
            for col in 1..<row {
                newRow.append(rows[row-1][col] + rows[row-1][col-1])
            }
            newRow.append(1)
            rows.append(newRow)
        }
        return rows
    }
}