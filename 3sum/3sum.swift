"""
all of them need to add to 0
requirements -> 2 positives 1 negative or 1 positive 2 negatives or 1 pos 1 neg 1 0 or 3 zeroes
must use separate indices

nums[i] + nums[j] + nums[k] == 0

nums[i] + nums[j] = -nums[k]



index doesn't matter

can have multiple answers

brute force:
 loop thorugh all combinations and try adding them to 0

ans = []
for i in n
  for j in i+1..< n
    for k in j+1..< n
        if i + j + k == 0:
            return [i, j, k]

O(n^3)



O(n^2) time, O(n) space

1. put all values in dict
2. loop through i and j, make sure youre not using i and j in the dict
3. find k
"""

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var ans: [[Int]] = []
        var dict: [Int: Int] = [:]
        for n in nums {
            dict[n, default: 0] += 1
        }
        for i in 0..<nums.count {
            for j in i + 1..<nums.count {
                dict[nums[i]]! -= 1
                dict[nums[j]]! -= 1
                if dict[nums[i]] == 0 {
                    dict.removeValue(forKey: nums[i])
                }
                if dict[nums[j]] == 0 {
                    dict.removeValue(forKey: nums[j])
                }

                let k = (nums[i] + nums[j]) * -1
                if dict[k] != nil {
                    ans.append([nums[i], nums[j], k].sorted(by: <))
                }
                dict[nums[i], default: 0] += 1
                dict[nums[j], default: 0] += 1
            }
        }
        return Array(Set(ans))
    }
}