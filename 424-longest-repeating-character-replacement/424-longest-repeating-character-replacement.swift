"""
need: longest substring
valid edits: k

constraints: uppercase letters (26)

sliding window: valid = k = remainingReplacements >= 0
replace -> replace non majority

ABBAAAC?
{A: 4, B: 2} if any non majority replaced, replacements - 1

AABBA
{A: 2, B: 2} replace any, replacements - 1 maj -> A, B

{A: 3, B: 2} maj -> A

k edits = total window count - majority count

can you extend window? if not majority && replacements == 0 (not in dict)
add in, then check if still have valid edits 

"""
class Solution {
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        var (l, r) = (0, 0)
        var longestLength = 0
        var arr = Array(s)
        var elements: [Character: Int] = [:]
        func windowIsExtendable() -> Bool {
            elements[arr[r], default: 0] += 1
            let windowCount = r - l + 1
            let majorityCount = elements.values.max() ?? 0
            let validWindow = windowCount - majorityCount <= k
            if !validWindow {
                elements[arr[r], default: 0] -= 1
                return false
            }
            return validWindow
        }
        let N = s.count
        while r < N {
            if windowIsExtendable() {
                longestLength = max(longestLength, r - l + 1)
                r += 1
            } else {
                elements[arr[l], default: 0] -= 1
                l += 1
            }
        }
        return longestLength
    }
}