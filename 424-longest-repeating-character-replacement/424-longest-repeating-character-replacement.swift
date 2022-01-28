"""
AABBBCD, k = 1

ABBA, k = 1 -> 3

A, k = 0 -> 1

ABABBAC, k = 1 -> 4

AB

{A} k = 1, maj = A

ABC, k = 2

count of diff chars <= k

valid window -> same character with k diff
A: 1, k = 1
A: 2, k = 1
{A: 2, B: 1}, k = 0, maj = A
{A: 1, B: 1}, k = 0, maj = A
{B: 1}, k = 0, maj = B

"AABABBA"
1

"""
class Solution {
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        var chars: [Character] = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
        var arr = Array(s)
        var longest = 0
        for char in chars {
            // var dict: [Character: Int] = [:]
            var l = 0
            var diffs = 0
            for r in 0..<arr.count {
                let cur = arr[r]
                if cur != char {
                    diffs += 1
                }
                while diffs > k {
                    if arr[l] != char {
                        diffs -= 1
                    }
                    l += 1
                }
                
                longest = max(longest, r - l + 1)
            }
        }
        return longest
    }
}