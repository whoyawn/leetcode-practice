"""
[000]  0,2 
[000]  1,1 
[000]  2,0

[0001]   0,3 = n - 1
[0010]   1,2
[0100]   2,1
[1000]   3,0
A = -1
B = 1

[A00]  0,2 
[0A0]  1,1 
[BBA]  2,0
"""
class Solution {
    func tictactoe(_ moves: [[Int]]) -> String {
        var cols = [Int:Int]()
        var rows = [Int:Int]()
        var diag = 0
        var adiag = 0
        var count = 0
        
        for (i, move) in moves.enumerated() {
            let row = move[0]
            let col = move[1]
            let player = i % 2 == 0 ? "A" : "B"
            let delta = i % 2 == 0 ? -1 : 1
            cols[col, default: 0] += delta
            rows[row, default: 0] += delta
            if row == col {
                diag += delta
            }
            if row + col == 2 {
                adiag += delta
            }
            
            if abs(cols[col, default: 0]) == 3 {
                return player
            }
            if abs(rows[row, default: 0]) == 3 {
                return player
            }
            if abs(diag) == 3 {
                return player
            }
            if abs(adiag) == 3 {
                return player
            }
            count += 1
        }
        return count < 9 ? "Pending" : "Draw"
    }
}