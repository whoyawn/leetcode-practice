"""

nums1 is subset of nums2

nums2.count >= nums1.count

no dupes

the next greater element for each value of nums1 

1. find index such that values in both arrays are the same

brute solution:
1. find nums1[i] in nums2
2. then look to right until you reach the end of get NGE

runtime: O(n^2), O(1) space

hash map?  
time: O(m + n), space: O(n)

[16,4,3,2,1]
"""
class Solution {
    func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        // key: ele, value, nge
        var nums2NgeMap: [Int:Int] = [:]
        var ngeStack: [Int] = []
        for num in nums2 {
            while !ngeStack.isEmpty && ngeStack.last! < num {
                let popped = ngeStack.removeLast()
                nums2NgeMap[popped] = num
            }
            ngeStack.append(num)
        }
        while !ngeStack.isEmpty {
            let e = ngeStack.removeLast()
            nums2NgeMap[e] = -1
        }
        var nextGreaterElements: [Int] = []
        for num in nums1 {
            let nge = nums2NgeMap[num]!
            nextGreaterElements.append(nge)
        }
        return nextGreaterElements
    }
}
