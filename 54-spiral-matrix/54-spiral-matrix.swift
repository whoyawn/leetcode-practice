class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        enum Direction {
            case u
            case d
            case l
            case r
            
            var delta: (Int, Int) {
                switch self {
                    case .u:
                        return (-1, 0)
                    case .d:
                        return (1, 0)
                    case .l:
                        return (0, -1)
                    case .r:
                        return (0, 1)
                }
            }
            
            var turned: Direction {
                switch self {
                    case .u:
                        return .r
                    case .d:
                        return .l
                    case .l:
                        return .u
                    case .r:
                        return .d
                }
            }
        }
        
        var direction: Direction = .r
        var copy = (0..<matrix.count).map { _ in Array(repeating: 0, count: matrix[0].count) }
        var totalSize = matrix.count * matrix[0].count
        var (row, col) = (0, 0)
        var spiralOrder: [Int] = []
        func isValid(_ row: Int, _ col: Int) -> Bool {
            row >= 0 && row < copy.count && col >= 0  && col < copy[0].count && copy[row][col] == 0
        }
        
        while totalSize > 0 {
            if copy[row][col] == 0 {
                spiralOrder.append(matrix[row][col])
                copy[row][col] = 1
                totalSize -= 1
            }
            let next = direction.delta
            let newRow = row + next.0
            let newCol = col + next.1
            if !isValid(newRow, newCol) {
                direction = direction.turned
            } else {
                (row, col) = (newRow, newCol)
            }
        }
        return spiralOrder
    }
}