class Solution {
    func wallsAndGates(_ rooms: inout [[Int]]) {
		var queue: [(coord: (Int, Int), dist: Int)] = []
        for row in 0..<rooms.count {
            for col in 0..<rooms[row].count {
                if rooms[row][col] == 0 {
                    queue.append(((row, col), 0))
                }
            }
        }

        while let front = queue.first {
            queue.removeFirst()
            let deltas = [(0, 1), (0, -1), (1, 0), (-1, 0)]
            for d in deltas {
                let newValue = ((front.coord.0 + d.0, front.coord.1 + d.1), front.dist + 1)
                let coords = (newValue.0.0, newValue.0.1)
                if coords.0 < 0 || coords.0 >= rooms.count || coords.1 < 0 || coords.1 >= rooms[0].count {
                    continue
                }
                if rooms[coords.0][coords.1] == Int32.max {
                    rooms[coords.0][coords.1] = front.dist + 1
                    queue.append(newValue)
                }
            }
        }
    }
}
