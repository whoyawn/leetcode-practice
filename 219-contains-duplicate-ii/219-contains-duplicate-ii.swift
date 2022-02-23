class Solution {
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        var dict: [Int:Int] = [:]
        for (i, num) in nums.enumerated() {
            if let prevIndex = dict[num], abs(i - prevIndex) <= k {
                return true
            } else {
                dict[num] = i
            }
        }
        return false
    }
}