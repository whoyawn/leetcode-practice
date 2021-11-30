"""

prefix array: leftMax
rightMax
min(leftMax, rightMax) - height[i]

[0,1,0,2,1,0,1,3,2,1,2,1]

space: O(n)
time: O(n)
"""
class Solution {
    func trap(_ height: [Int]) -> Int {
        var leftMax: [Int] = Array(repeating: 0, count: height.count)
        var rightMax: [Int] = Array(repeating: 0, count: height.count)
        var water: [Int] = Array(repeating: 0, count: height.count)
        var localMax = 0
        for i in 1..<height.count {
            localMax = max(localMax, height[i-1])
            leftMax[i] = localMax
        }
        localMax = 0
        for i in (0..<height.count - 1).reversed() {
            localMax = max(localMax, height[i+1])
            rightMax[i] = localMax
        }
        for i in 0..<water.count {
            water[i] = max(min(leftMax[i], rightMax[i]) - height[i], 0)
        }
        return water.reduce(0, +)
    }
}