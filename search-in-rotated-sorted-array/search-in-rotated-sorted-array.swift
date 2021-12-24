"""
pivot: nums[i] < nums[i-1] && nums[i+1..n-1] < nums[0...i-1]

mid -> 
1,2,3,4,5

1,2,3,4,5,0   target = 0 search right

1,2,3,4,5,0   target = 2 search left

1,2,3,4,5,0   target = 5 search right

5,0,1,2,3,4   target = 5 search left

if nums[lo] > target && nums[lo] > nums[hi], search in rotation (right side)
means is rotated

[1]
[1,2]
if low <= hi

discarding bsearch:

if target < mid
    target >= nums[lo], search left
    target < nums[lo], search right
if target > mid
    target <= nums[hi], search right
    target > nums[hi], search left
else
    return

[1,2,3,4,5,6,7,8]

[8,1,2,3,4,5,6,7]
6

[4,5,6,7,8,1,2,3]
8
"""
class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var (lo, hi) = (0, nums.count - 1)
        while lo <= hi {
            let mid = (lo + hi) / 2
            if target < nums[mid] {
                if nums[mid] < nums[lo] || nums[lo] <= target { // rotated
                    hi = mid - 1
                } else {
                    lo = mid + 1
                }
            } else if target > nums[mid] {
                if nums[mid] > nums[hi] || nums[hi] >= target { // rotated or target in range
                    lo = mid + 1
                } else {
                    hi = mid - 1
                }
            } else {
                return mid
            }
        }
        return -1
    }
}