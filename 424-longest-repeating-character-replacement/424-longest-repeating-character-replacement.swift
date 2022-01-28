"""
AABBBCD, k = 1

ABBA, k = 1 -> 3

A, k = 0 -> 1

ABABBAC, k = 1 -> 4

ABA

{A: 2, B; 1} k = 1, maj count = 2, leftover: 1

Look for non majorit;

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
            var l = 0
            var r = 0
            var diffs = 0
            while r < arr.count {
                let cur = arr[r]
                if cur != char && diffs == k {
                    if arr[l] != char {
                        diffs -= 1
                    }
                    l += 1
                } else {
                    if cur != char {
                        diffs += 1
                    }
                    longest = max(longest, r - l + 1)
                    r += 1
                }
            }
        }
        return longest
    }
}