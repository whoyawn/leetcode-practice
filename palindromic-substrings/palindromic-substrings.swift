"""
each character is a palindromic substring

at min there are n palindromes

1. count substring with condition: palindrome
2. palindrome
a. reads left to right -> flip and the values on each side is the same
b. odd palindrome aba 1 different character, even palindrome has 2 same characters

brute force -> look at all substrings, ask if it's a palindrome, then count another -> n^3

if it's a pal, then the outsides are a pal
bab
cbcbc

for each letter, if you expand it and both sides are pal iff values are the same
aaaa

aba -> 4
abb -> 3
aaa -> 6

aaaa a, a, a, a, aa, aa, aa, aaa, aaa, aaaa

2 1 1

aaa


1 2 1


if you have even number, the calculate it differently than odd

bbaabb
"""

class Solution {
    func countSubstrings(_ s: String) -> Int {
        var palindromes = 0
        let arr = Array(s)
        // odd
        for i in 0..<s.count {
            var l = i
            var r = i
            while l >= 0 && r < s.count && arr[l] == arr[r] {
                palindromes += 1
                l -= 1
                r += 1
            }
        }
        // even
        for i in 0..<s.count {
            var l = i
            var r = i + 1
            while l >= 0 && r < s.count && arr[l] == arr[r] {
                palindromes += 1
                l -= 1
                r += 1
            }
        }
        return palindromes
    }
}