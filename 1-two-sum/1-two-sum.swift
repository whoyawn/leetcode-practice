class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict: [Int:Int] = [:]
        for (i, num) in nums.enumerated() {
            if let j = dict[target - num] {
                return [i, j]
            }
            dict[num] = i
        }
        return []
    }
}