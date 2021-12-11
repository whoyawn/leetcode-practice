// O(n) time
// O(n) space
class Solution {
    func minRemoveToMakeValid(_ s: String) -> String {
        var stack: [(Int, Character)] = []
        var arr = Array(s)
        for (i, char) in arr.enumerated() {
            if char == "(" {
                stack.append((i, char))
            } else if char == ")" {
                if stack.last?.1 == "(" {
                    stack.removeLast()
                } else {
                    stack.append((i, char))
                }
            }
        }
        var skipSet = Set<Int>(stack.map { $0.0 })
        var validChars: [Character] = []
        for (i, char) in arr.enumerated() {
            if !skipSet.contains(i) {
                validChars.append(char)
            }
        }
        return String(validChars)
    }
}