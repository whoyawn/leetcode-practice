class Solution {
    func lengthOfLongestSubstringTwoDistinct(_ s: String) -> Int {
        var (l, r) = (0, 0)
        var dictionary: [Character: Int] = [:]
        var count = s.count
        var longestSubstringCount = 0
        var arr = Array(s)
        while r < count {
            if dictionary[arr[r]] == nil && dictionary.count >= 2 {
                dictionary[arr[l], default: 0] -= 1
                if dictionary[arr[l], default: 0] == 0 {
                    dictionary.removeValue(forKey: arr[l])
                }
                l += 1
            } else {
                dictionary[arr[r], default: 0] += 1
                longestSubstringCount = max(longestSubstringCount, r - l + 1)
                r += 1
            }
        }
        return longestSubstringCount
    }
}
