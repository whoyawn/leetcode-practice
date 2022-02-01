"""
[2,1,1,1,2]
1

k = 1, k = 0
[2]
[1]
[1,1] [1]
[1,1,1] [1,1] [1]
[2]


"""
class Solution {
    func subarraysWithKDistinct(_ nums: [Int], _ k: Int) -> Int {
        func countGoodArrays(_ k: Int) -> Int {
            if k == 0 { return 0 }
            var (l, r) = (0, 0)
            var dictionary: [Int: Int] = [:]
            var count = nums.count
            var goodArraysAtK = 0
            while r < count {
                // if cannot add
                if dictionary[nums[r]] == nil && dictionary.count >= k {
                    dictionary[nums[l], default: 0] -= 1
                    if dictionary[nums[l], default: 0] <= 0 {
                        dictionary.removeValue(forKey: nums[l])
                    }
                    l += 1
                } else {
                    dictionary[nums[r], default: 0] += 1
                    goodArraysAtK += r - l + 1
                    r += 1
                }
            }
            return goodArraysAtK
        }
        
        print(countGoodArrays(k))
        print(countGoodArrays(k - 1))

        return countGoodArrays(k) - countGoodArrays(k - 1)
    }
}
