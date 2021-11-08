"""
find all 3 distinct indices where they add to 0

nums[i] + nums[j] + nums[k] == 0

nums[i] + nums[j] = -nums[k]

nums[k] = -nums[i] - nums[j]

brute force -> O(n^3)

O(n^2)

if you're finding k 
-> look up k with a hash map.. O(1) time, O(n) space
-> binary search O(log n), O(n) space

O(1) space, O(1)
                        k
                           i      j
[-1,0,1,2,-1,-4] -> [-2,-1,-1,0,0,1,2,4]
[[-1,-1,2],[-1,0,1]

t = 1
[-2,0,2][-1,-1,2] [-1,0,1]

if j + i = -k, then answer

[-2,-1,-1,0,0,1,2,4]
[]
[1]
[2]
[2,2]
[1,2,3]
[-1,0,1]
[0,0,0]
[0,0,0,0]

[-2,0,1,1,2]
[-2,0,2] [-2,1,1]

time: O(n^2)
space: O(1)
"""

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var triplets = Set<[Int]>()
        let nums = nums.sorted()
        for ki in (0..<nums.count) {
            let k = nums[ki]
            var (i, j) = (ki + 1, nums.count - 1)
            while i < j {
                if nums[i] + nums[j] == -k {
                    triplets.insert([k, nums[i], nums[j]])
                    i += 1
                    j -= 1
                } else if nums[i] + nums[j] > -k {
                    j -= 1
                } else {
                    i += 1
                }
            }
        }
        return Array(triplets)
    }
}