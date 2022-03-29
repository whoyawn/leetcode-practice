class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var largestSum = nums[0]
        var runningSum = 0
        for n in nums {
            runningSum += n
            largestSum = max(largestSum, runningSum)
            if runningSum < 0 {
                runningSum = 0
            }
        }
        return largestSum
    }
}