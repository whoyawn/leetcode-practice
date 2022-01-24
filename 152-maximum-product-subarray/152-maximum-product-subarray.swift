 """
output: product

largest product:

product: positive: pos pos / neg neg
nega: pos neg

[1,2,3,4]
[1,2,3,-4] -> [1,2,3]
[-1,2,3,4] -> [2,3,4]
[1,2,-3,4,5,6] -> [4,5,6]
[1,2,-3,-4] -> [1,2,-3,-4]
[1,2,-3,-4,5,6] -> [1,2,-3,-4,5,6]
[1,2,-3,-4,5,-6] -> [1,2,-3,-4,5]
[1,-2]
[-1,2,3,-4,-5,6]

if max pos * neg, that's smallest possible, min
if max pos * pos -> maximum
if max neg * neg -> maximum
max neg * pos -> min

adding a new number can only expand your local max

0 throws away the maximum at that point, start over from 1 and compare to prev max

[-2,2,-1,-6]

1. loop through, build local maximum
2. keep track of largest + number so far and largest - number so far
3. multiply both in both times
3.5 running product, reset to 1 whenever see 0
4. at each point, largest pos = max(running * cur, currentMax)
largest neg = min(running * cur, currentMin)
   6
     -12  24
[2,3,-2,  4]
ans = 6

   6
     -6 -24 48 
[2,3,-2, 4, -2]

-1 -1 -1-1 
-1 -2
[-1,2,3,4] -> [2,3,4]
[2,-1] -> [2]
[1,2,3,4]
[2,3,-2,4,-2]

"""
class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return -1 }
        var globalMax = nums[0]
        var localMax = 1
        var localMin = 1
        for num in nums {
            let products = [localMax * num, localMin * num, num]
            localMax = products.max()!
            localMin = products.min()!
            
            globalMax = max(globalMax, localMax)
        }
        
        return globalMax
    }
}