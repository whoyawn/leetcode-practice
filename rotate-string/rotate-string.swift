"""
shift left vs shift right?

shifts = n

abcd

 bcdabcda

cdab .... s = abcd, goal = cdab

dabc

abcd

abcdabcd
  cdabcdab


no matter how many times you shift, you'll still have a partial substring match to the original

brute force: rotate n times until you have a match string -> O(n^2)

s = "abcde", goal = "abced"

abcedabced

bcedabceda

s = "aa" goal = "a"
"""

class Solution {
    func rotateString(_ s: String, _ goal: String) -> Bool {
        return (goal + goal).contains(s) && goal.count == s.count
    }
}