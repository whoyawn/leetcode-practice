"""
[1,2,3,4,8,2,7,8]

Output: [5,6]

O(n) time
O(n) space
"""
class Solution {
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        let s = Set(nums)
        var disappeared: [Int] = []
        for i in 1...nums.count {
            if !s.contains(i) {
                disappeared.append(i)
            }
        }
        return disappeared
    }
}