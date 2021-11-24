"""
[1]
[1,1]
[1,2,1] row = 2
[1,3,3,1]
[1,4,6,4,1]
[1,5,10,10,5,1]


[5,10,10,5,1] i = 5

arr[i][j] = arr[i-1][j] + arr[i-1][j-1]
replace arr[i][j-1], then move j up
"""
class Solution {
    func getRow(_ rowIndex: Int) -> [Int] {
        var lastRow = [1]
        for row in 1..<rowIndex+1 {
            for col in 1..<row {
                lastRow[col-1] = lastRow[col] + lastRow[col-1]
            }
            lastRow = [1] + lastRow
        }
        return lastRow
    }
}