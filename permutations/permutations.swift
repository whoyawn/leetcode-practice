"""
1. design search space
what are states (partial solutions)
[1]
[1,2]   [1,3]
[1,2,3] [1,3,2]

[2]
[1][3]

[3]
[1][2]

children:
children = n - 1

goal state?
any array
"""
class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var perms: [[Int]] = []
        var state: [Int] = []
        dfs(&perms, &state, nums)
        return perms
    }
    
    func dfs(_ perms: inout [[Int]], _ state: inout [Int], _ nums: [Int]) {
        if nums.isEmpty {
            perms.append(state)
            return
        }
        for (i, num) in nums.enumerated() {
            state.append(num)
            var remaining = nums
            remaining.remove(at: i)
            dfs(&perms, &state, remaining)
            state.removeLast()
        }
    }
}