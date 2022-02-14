"""
two pointers
writer & reader

move reader, if new letter, then writer writes cur and count

total count = reader + 1

0. write char, move
1. write count
2. move
"""
class Solution {
    func compress(_ chars: inout [Character]) -> Int {
        if chars.isEmpty { return 0 }
        chars.append("¡")
        var writer = 0
        var cur = chars[0]
        var count = 1
        for (reader, char) in chars.enumerated() where reader > 0 {
            if cur != char {
                chars[writer] = cur
                writer += 1
                cur = char
                guard count > 1 else { continue }
                let nums = Array(String(count))
                for num in nums {
                    chars[writer] = num
                    writer += 1
                }
                count = 1
            } else {
                count += 1
            }
        }
        
        return writer
    }
}