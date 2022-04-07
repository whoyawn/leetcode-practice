"""
any two bars that create a container

find max

any container area = height = min(left, right) * width

brute:
all combos O(n^2)

if you move big tower, all are going to be smaller area
always move smaller tower

moving higher tower makes no difference
"""
class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var area = 0
        var (l, r) = (0, height.count - 1)
        while l < r {
            area = max(area, min(height[l], height[r]) * (r - l))
            if height[l] < height[r] {
                l += 1
            } else {
                r -= 1
            }
        }
        return area
    }
}