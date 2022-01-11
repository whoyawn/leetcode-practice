"""
design search space
 1     2   3
2 3   3.1 
3 2

branching factor = arr size - 1
"""
class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var permutations: [[Int]] = []
        var state: [Int] = []
        func backtracking() {
            if state.count == nums.count {
                permutations.append(state)
            }
            for num in nums where !state.contains(num) {
                state.append(num)
                backtracking()
                state.removeLast()
            }
        }
        backtracking()
        
        return permutations
    }
}