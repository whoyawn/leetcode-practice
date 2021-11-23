/**
nums = [5,2,3,4]

pres = [1,5,10,30]
sufs = [24,12,4,1]
prefixes[i] = left side products = nums[i-1] * prefix[i-1]
suffixes[i] = right side = nums[i+1] * suffix[i+1]
products[i] = prefixes[i] * suffixes[i]
*/
class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var prefixes = Array(repeating: 1, count: nums.count)
        var suffixes = Array(repeating: 1, count: nums.count)
        for i in 1..<nums.count {
            prefixes[i] = nums[i-1] * prefixes[i-1]
        }
        for i in (0..<nums.count-1).reversed() {
            suffixes[i] = nums[i+1] * suffixes[i+1]
        }
        var products: [Int] = []
        for i in 0..<nums.count {
            products.append(prefixes[i] * suffixes[i])
        }
        return products
    }
}