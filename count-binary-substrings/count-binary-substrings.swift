"""

00011100 -> 01, 0011, 000111
vvvvvv
    vvvv 
00111001 -> 01, 0011, 10, 1100, 01 = 5

[0]
group = 5
when encounter flip, dequeue all until you get the flip's opposite
flip: c != cur
- dequeue all of cur
- do a comparison, group += 1
- stop when queue's front is cur

time: O(n+n) -> O(n)
space: O(n)


"00110011" 2
[1,1]
"""
class Solution {
    func countBinarySubstrings(_ s: String) -> Int {
        var groups = 0
        var arr = Array(s)
        var queue: [Character] = [arr[0]]
        var cur = arr[0]
        for i in 1..<arr.count {
            let c = arr[i]
            // flip
            if c != cur {
                while let first = queue.first, first == c {
                    queue.removeFirst()
                }
                cur = c
            }
            queue.append(c)
            if let first = queue.first, first != c {
                queue.removeFirst()
                groups += 1
            }
        }
        return groups
    }
}