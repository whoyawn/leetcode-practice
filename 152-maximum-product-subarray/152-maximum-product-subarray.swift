"""
[2,3,-2,-5,6,-1,4] -> 60
[2,3,-2,-5,6,-10,10]

"""
class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return -1 }
        var (pre, suf) = (1, 1)
        var largestProduct = nums[0]
        for (front, back) in zip(nums, nums.reversed()) {
            largestProduct = max(largestProduct, pre * front, suf * back)
            if front == 0 {
                pre = 1
            } else {
                pre *= front
            }
            if back == 0 {
                suf = 1
            } else {
                suf *= back
            }
        }
        return largestProduct
    }
}