"""
n pairs = 6 characters total

backtracking:
1. design search space
partial solutions
()
(())
()()

neighbors/children
2 children
(
(       )
(( ()   )( ))
goal state
n*2 char long, 3 left 3 right

2. dfs on search space
"""
class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        func backtracking(_ state: inout [Character], _ leftCount: Int, _ rightCount: Int) {
            if state.count == n * 2 {
                combinations.append(String(state))
                return
            }
            // pruning
            if leftCount < n {
                state.append("(")
                backtracking(&state, leftCount + 1, rightCount)
                state.removeLast()
            }
            // pruning
            if rightCount < n && rightCount < leftCount {
                state.append(")")
                backtracking(&state, leftCount, rightCount + 1)
                state.removeLast()
            }
        }
        
        var combinations = [String]()
        var state = [Character]()
        backtracking(&state, 0, 0)
        return combinations
    }
}