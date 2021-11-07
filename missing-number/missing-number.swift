"""
unique numbers
from 0 to n, no gaps

1. iterate from 0 to n, put in hash map first, and then find the missing one
O(n) space, O(n) time

count of array is n

sort?

1. add numbers together
2. add numbers with proper one in range
get the difference
O(n) time, O(1) space

"""
class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        var numsSum = nums.reduce(0) { $0 + $1 }
        return (0...nums.count).reduce(0) { $0 + $1 } - numsSum
    }
}