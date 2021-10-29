"""
contigouos subarray

largest sum

array can be at least one element

brute force:
- calculate all subarrays -> O(n^2)
- minimum -> O(n)


if all the elements in subarray prev to current element are < 0, disregard because curr is higher than all combined

maximum can only go up if you have a positive number in the prev subarray
"""
class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var maxSum = nums[0]
        var currSum = 0
        for n in nums {
            currSum += n
            maxSum = max(maxSum, currSum)
            if currSum < 0 {
                currSum = 0
            }
        }
        return maxSum
    }
}