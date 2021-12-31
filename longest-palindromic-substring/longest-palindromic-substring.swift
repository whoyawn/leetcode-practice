"""
substring

max: itself
min: 1

1. look from mid to outside
2. outside to mid

how do you know middle?

"aabaa"

n^2
for each char
two pointers, confirm if l - 1 == r + 1 until you have non matching
"""
class Solution {
    func longestPalindrome(_ s: String) -> String {
        let arr = Array(s)
        let count = arr.count
        var (s, e) = (0, 0)
        for i in 0..<count {
            var (l, r) = (i-1, i+1)
            while l >= 0 && r < count && arr[l] == arr[r] {
                if r - l > e - s {
                    (s, e) = (l, r)
                }
                l -= 1
                r += 1
            }
            
            (l, r) = (i, i+1)
            while l >= 0 && r < count && arr[l] == arr[r] {
                if r - l > e - s {
                    (s, e) = (l, r)
                }
                l -= 1
                r += 1
            }
        }
        return String(arr[s...e])
    }
}