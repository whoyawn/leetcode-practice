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
        var nums2IndexMap: [Int:Int] = [:] // key: ele, val: index
        for (i, num) in nums2.enumerated() {
            nums2IndexMap[num] = i
        }
        var ngeStack: [(val: Int, i: Int)] = [(nums2[0], 0)]
        var nextGreaterElementMap: [Int] = Array(repeating: 0, count: nums2.count)
        for i in 1..<nums2.count {
            let num = nums2[i]
            while !ngeStack.isEmpty && ngeStack.last!.val < num {
                let popped = ngeStack.removeLast()
                nextGreaterElementMap[popped.i] = num
            }
            ngeStack.append((num, i))
        }
        while !ngeStack.isEmpty {
            let i = ngeStack.removeLast().i
            nextGreaterElementMap[i] = -1
        }
        var nextGreaterElements: [Int] = []
        for num in nums1 {
            let i = nums2IndexMap[num]!
            nextGreaterElements.append(nextGreaterElementMap[i])
        }
        return nextGreaterElements
    }
}