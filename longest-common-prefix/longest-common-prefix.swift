class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        var arrs = strs.map { Array($0) }
        var lcp = 0
        var shortest = Int.max
        for s in strs {
            shortest = min(s.count, shortest)
        }
        var output: [Character] = []
        while lcp < shortest {
            let char = arrs[0][lcp]
            if arrs.allSatisfy { $0[lcp] == char } {
                output.append(char)
                lcp += 1
            } else {
                return String(output)
            }
        }
        return String(output)
    }
}