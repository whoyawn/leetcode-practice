"""
P   A   H   N
A P L S I I G
Y   I   R

3 1 3 1 3 1 2 <- end

P     I    N   0
A   L S  I G  1
Y A   H R     2 
P     I       3

4 1 1 4 1 1 2

down = 4 row
across = 1 row

PYAP
 A
  L
IHSI

ROW = 3
i.  i.  i.  i.  = step = 4
 j. j. j. j  j   step = 2
  k   k.  k.  k.  step = 4    
PAYPALISHIRING

rows
loop until rows-1
loop until 0
down
across
row - 1
col + 1

Time: O(numRows * s.count)
Space: O(numRows * s.count)

"AB"
1

"AB"
2

A
B
"""
class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        guard numRows > 1 else { return s }
        var matrix: [[Character?]] = (0..<numRows).map { _ in Array(repeating: nil, count: s.count) }
        var row = 0
        var col = 0
        let down = (1, 0)
        let across = (-1, 1)
        let arr = Array(s)
        var goingDown = true
        for i in 0..<arr.count {
            let c = arr[i]
            matrix[row][col] = c
            if row == numRows - 1 {
                goingDown = false
            } else if row == 0 {
                goingDown = true
            }
            if goingDown {
                row += down.0
                col += down.1
            } else {
                row += across.0
                col += across.1
            }
        }
        var zigzag: [Character] = []
        for rowi in 0..<numRows {
            for coli in 0..<matrix[0].count {
                if let c = matrix[rowi][coli]  {
                    zigzag.append(c)
                }
            }
        }
        return String(zigzag)
    }
}