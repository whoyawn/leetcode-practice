"""

4 = 
1111
121
112
211
22

f(4) = f(3) + 1 or f(2) + 2 = 5
f(3) = f(2) + 1 or f(1) + 2 = 3
f(2) = f(1) + 1 or 1 = 2
f(1) = 1
f(0) = 0

start = 0

(0+1, 2) + (0+2, 2) -> 1
(1+1, 2) 1

(0, 2)

(1, 2) +         (2, 2)
(2, 2) + (3, 2) + 0
"""
class Solution {
    func climbStairs(_ n: Int) -> Int {
        var mem: [Int: Int] = [:]
        return climbStairs(0, n, &mem)
    }
    
    func climbStairs(_ i: Int, _ n: Int, _ mem: inout [Int:Int]) -> Int {
        if let cached = mem[i] {
            return cached
        }
        if i > n {
            return 0
        }
        if i == n {
            return 1
        }
        
        let ans = climbStairs(i + 1, n, &mem) + climbStairs(i + 2, n, &mem)
        mem[i] = ans
        return ans
    }
}