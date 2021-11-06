"""
s, t -> lowercase, a-z

min window SUBSTRING of s

smallest substring possible that also includes t

valid: substring s has all of t -> all(t) in substring, substring contains (t), t is subset of s

invalid: substring s has only some or none of t

expand until valid, then minimize until invalid -> min left

min : 6
s = "ADOBECODEBANC" t = "ABC"
first = "ADOBEC" -> 6
second = "DOBECODEBA" -> 10
third = "CODEBA" -> 5
fourth = "ODEBANC" -> 7
fifth = "BANC" -> 4 ... store as tuple

4

s = "a", t = "a"
first = "a" -> 1

1

s = "a", t = "aa"
0, ""


s = "a", t = ""

s = "", t = "a"

s = "aaa" t = "aa"
first = "aa"
second = "aa"


O(n * m) time
space O(n)

 ij
"aa"
"aaa"
s = "ADOBECODEBANC" t = "ABC"
first = "ADOBEC" -> 6
second = "DOBECODEBA" -> 10
third = "CODEBA" -> 6
fourth = "ODEBANC" -> 7

sixth = "BANC" -> 4

1. add until you have a valid
2. shrink until you have an invalid

"""
class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        guard s.count >= t.count else {
            return ""
        }
        guard !t.isEmpty else {
            return s
        }
        var arr = Array(s)
        var sub = Array(t)
        var minSoFar: (len: Int, str: ArraySlice<Character>) = (Int.max, [])
        var (i, j) = (0, 0)
        var have: [Character:Int] = [:]
        var haveCount = 0
        var need: [Character:Int] = [:]
        sub.forEach { 
            need[$0, default: 0] += 1
        }
        let needCount = need.count
        let count = s.count
        while j < count {
            let c = arr[j]
            have[c, default: 0] += 1
            // Is there enough characters to match need?
            if need[c] != nil && have[c]! == need[c]! {
                haveCount += 1
            }
            j += 1
            // valid window, enough counts
            while haveCount == needCount {
                let size = j - i
                if size < minSoFar.len {
                    minSoFar = (size, arr[i..<j])
                }
                let l = arr[i]
                have[l]! -= 1
                if need[l] != nil && have[l]! < need[l]! {
                    haveCount -= 1
                }
                i += 1
            }
        }
        return String(minSoFar.str)
    }
}