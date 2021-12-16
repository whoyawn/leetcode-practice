"""
1's place alt 0/1 every 1 number
10's place alt 0/1 every 2 numbers
100's place alt 0/1 every 3 probably

when you get to 1, start back from x00

"" 2^0
x 2^1 combos
xx 2^2 comboinations
xxx 2^3

1 = 0    0
2 = 10   1
3 = 11   00
4 = 100  01
5 = 101  10
6 = 110  11
7 = 111  11
"""
class Solution {
    // func encode(_ num: Int) -> String {
    //     var s = String(num + 1, radix: 2)
    //     s.removeFirst()
    //     return s
    // }
    func encode(_ num: Int) -> String {
        return num > 0 ? encode((num - 1) / 2) + ["1", "0"][num % 2] : ""
    }
}