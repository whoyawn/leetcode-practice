"""
MDAS
_

2+2+5 -> left to right, current count, if you see +, ready an operation, once you get to the second number, then do the operation, reset operation

operation: +, -, *, /
current: __

2*224444*2 -> same as above
2+3*2+2+3*3*3/2 -> 2 + (3*2)

-2*4 = -8

4-3*10+5 = 4-(3*5)
4-30+5
               c
(0+) 4 -3*10+10/5 =
  [4]-[30]+[1]=

a = 4
s = [4,-,30,/,5]
n = "5"

go through string, find all the MD, calculate first, then add again
if op is + add on stack
op is *, you wait until next
same with /
if its -, then next number you add is gonna be -
[3,8]
"3+2*4+3+0"
"""
class Solution {
    func calculate(_ s: String) -> Int {
        var stack: [Int] = []
        var arr = Array(s) + ["+"]
        var number = ""
        var op: Character = "+"
        let ops: [Character] = ["*", "/", "+", "-"]
        for (i, c) in arr.enumerated() {
            if c.isNumber {
                number += String(c)
            } else if ops.contains(c) {
                let ans = Int(number)!
                switch op {
                case "-":
                    stack.append(-ans)
                case "*":
                    stack.append(stack.removeLast() * ans)
                case "+":
                    stack.append(ans)
                default:
                    stack.append(stack.removeLast() / ans)
                }
                op = c
                number = ""
            }
        }
        return stack.reduce(0) { $0 + $1 }
    }
}