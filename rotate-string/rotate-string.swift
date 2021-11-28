"""
same relative order

a bcde -> bcde a

ab cde -> cde ab .. cde .. ab .. cde .. ab

ab cdeab cde

abcdeabcde

abcdeabcde

a a
"""

class Solution {
    func rotateString(_ s: String, _ goal: String) -> Bool {
        guard s.count == goal.count else { return false }
        return (s+s).contains(goal)
    }
}