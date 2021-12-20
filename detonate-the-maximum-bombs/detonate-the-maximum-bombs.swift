class Solution {
    func maximumDetonation(_ bombs: [[Int]]) -> Int {
	   var maxBombs = 0
	   for i in 0..<bombs.count {
            var visited = Set<Int>()
            dfs(i, &visited, bombs)
            maxBombs = max(visited.count, maxBombs)
       } 
        return maxBombs
      }

	func dfs(_ cur: Int, _ visited: inout Set<Int>, _ bombs: [[Int]]) {
		if visited.contains(cur) {
			return
        }
        visited.insert(cur)
        for i in 0..<bombs.count where i != cur {
            if visitable(bombs[cur], bombs[i]) {
              dfs(i, &visited, bombs)
          }
       }
    }
    func visitable(_ cur: [Int], _ dest: [Int]) -> Bool {
        let curX = Double(cur[0])
        let curY = Double(cur[1])
        let destX = Double(dest[0])
        let destY = Double(dest[1])
        let dist = (pow(curX - destX, 2) + pow(curY - destY, 2)).squareRoot()
        return dist <= Double(cur[2])
    }
}

