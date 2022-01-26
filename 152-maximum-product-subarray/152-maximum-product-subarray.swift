"""
[2,3,-2,-5,6,-1,4] -> 60
[2,3,-2,-5,6,-10,10]

"""
class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return -1 }
        var (pre, suf) = (1, 1)
        var largestProduct = nums[0]
        for num in nums {
            largestProduct = max(largestProduct, pre * num)
            pre *= num
            if num == 0 {
                pre = 1
            }
        }
        for num in nums.reversed() {
            largestProduct = max(largestProduct, suf * num)
            suf *= num
            if num == 0 {
                suf = 1
            }
        }
        return largestProduct
    }
}