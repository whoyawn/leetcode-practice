"""
backtracking: implicit DFS on board when you find the first character
as you dfs, add onto path as long as it matches the next char in word
if not matching, then backtrack (stop, pop off)

end case: either built word == word or
dfs'ed on entire matrix

1. current pointer
2. current char
3. if current char == char at current pointer, then dfs, else stop
   c
 f c s
   e 
"""
class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        let charArr = Array(word)
        for row in 0..<board.count {
            for col in 0..<board[0].count {
                var visited = Set<[Int]>()
                let deepestIndex = dfs(board, 0, charArr, (row, col), &visited)
                if deepestIndex == word.count - 1 {
                    return true
                }
            }
        }
        return false
    }
    
    func dfs(_ board: [[Character]], _ wordIndex: Int, _ word: [Character], _ cur: (Int, Int), _ visited: inout Set<[Int]>) -> Int {
        if visited.contains([cur.0, cur.1]) {
            return -1
        }
        let row = cur.0
        let col = cur.1
        guard row >= 0 && row < board.count && col >= 0 && col < board[0].count else { return -1 }
        if word[wordIndex] != board[row][col] {
            return -1
        }
        if wordIndex == word.count - 1 {
          return wordIndex
        }
        
        let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]
        var maxIndex = 0
        for d in directions {
            let next = (row + d.0, col + d.1)
            visited.insert([cur.0, cur.1])
            let i = dfs(board, wordIndex + 1, word, next, &visited)
            visited.remove([cur.0, cur.1])
            maxIndex = max(i, maxIndex)
        }
        return maxIndex
    }
}