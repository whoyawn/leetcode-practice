"""
exit = cross pointers l > r
aba -> odd l = r
aaaa -> even
abba -> even

s = "abc" -> "ab" / "bc"

ignore 1 pointer 1 time

Input: s = "abca"
edge: "bbbf"

mismatch
- still valid if mismatch in middle

at most 1 mismatch
time: O(n)
space: O(n) create more
space: O(1) <= 2 runs on same string
"""
class Solution {
    func validPalindrome(_ s: String) -> Bool {
        let arr = Array(s)
        func valid(_ ignoreLeft: Bool) -> Bool {
            var (l, r) = (0, s.count - 1)
            var canIgnore = true
            while l <= r {
                if arr[l] != arr[r] {
                    if canIgnore {
                        if ignoreLeft {
                            r -= 1
                        } else {
                            l += 1
                        }
                        canIgnore = false
                    } else {
                        return false
                    }
                } else {
                    l += 1
                    r -= 1
                }
            }
            return true
        }
        
        return valid(true) || valid(false)
    }
}