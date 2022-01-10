"""
water = min(highest left, highest right)
O(n^2)

precalculate maxes via suffix/prefix array

rightMaxes[i]
leftMaxes[i]

right
[0,1,0,2,1,0,1,3,2,1,2,1]
[0,0,0,0,0,3,3,2,2,2,1,0]

left[i] = max of the left side
left
[0,1,0,2,1,0,1,3,2,1,2,1]
[0,0,]
curMax = max(oldMax, height[i-1])
oldMax = leftMax[i]

[5]
[0]
"""
class Solution {
    func trap(_ height: [Int]) -> Int {
        var rightMaxes = Array(repeating: 0, count: height.count)
        var leftMaxes = rightMaxes
        for i in 1..<leftMaxes.count {
            leftMaxes[i] = max(leftMaxes[i-1], height[i-1])
        }
        for i in (0..<rightMaxes.count - 1).reversed() {
            rightMaxes[i] = max(rightMaxes[i+1], height[i+1])
        }

        var water = 0
        for i in 0..<height.count {
            let bottleneck = min(leftMaxes[i], rightMaxes[i])
            if bottleneck > height[i] {
                water += bottleneck - height[i]
            }
        }
        return water        
    }
}