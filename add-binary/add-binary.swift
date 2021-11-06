"""

11
 1           2. 3. 1
100     0    1  2  0
a =" 1010", 0+1 1+1 0+0
b =" 1011"
   "10101"
"""
class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        var comp1: [Character] = []
        var comp2: [Character] = []
        if a.count < b.count {
            comp1 = Array(repeating: "0", count: b.count - a.count) + Array(a)
            comp2 = Array(b)
        } else {
            comp1 = Array(repeating: "0", count: a.count - b.count) + Array(b)
            comp2 = Array(a)
        }
        var sum: [Int] = []
        var carry = 0
        var i = comp1.count - 1
        while i >= 0 {
            let l = comp1[i].wholeNumberValue!
            let r = comp2[i].wholeNumberValue!
            sum.append(((l ^ r) ^ carry))
            if l + r + carry > 1 {
                carry = 1
            } else {
                carry = 0
            }
            i -= 1
        }
        if carry == 1 {
            sum.append(1)
        }
        let r = sum.reversed().map { Character(String($0)) }
        return String(r)
    }
}