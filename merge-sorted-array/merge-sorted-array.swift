"""
[1,2,3]
[2,5,6]
[1,2,2,3,5,6]

[1,2,3,0,0,0] [0,0,0,1,2,3]
[2,5,6]

[1,2,3,0,0,0,0]
[2,5,6,7]

[1x,2,2,3,5,6,7]

1. merge sort from the back
2. 2 pointer, fill in the one with greater value, move pointer to left
3. when one pointer exits, fill up the rest with the remaining

[1,2,3,0,0,0]
3
[4,5,6]
3

[1,2,3,4,5,6]
"""
class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var (l, r) = (m - 1, n - 1)
        var end = nums1.count - 1
        while l >= 0 && r >= 0 {
            if nums2[r] > nums1[l] {
                nums1[end] = nums2[r]
                r -= 1
            } else {
                nums1[end] = nums1[l]
                l -= 1
            }
            end -= 1
        }
        
        var (remaining, array) = l >= 0 ? (l, nums1) : (r, nums2)
        while remaining >= 0 {
            nums1[end] = array[remaining]
            remaining -= 1
            end -= 1
        }
    }
}