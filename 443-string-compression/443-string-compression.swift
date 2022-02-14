"""
maintain cur

see new char/end of array -> dump cur + (count if > 1)

convert count -> 12 int -> string -> char array, iterate left to right 

"""
class Solution {
    func compress(_ chars: inout [Character]) -> Int {
        if chars.isEmpty { return 0 }
        var s: [Character] = []
        var cur = chars[0]
        var count = 1
        for (i, char) in chars.enumerated() where i > 0 {
            if cur == char {
                count += 1
            } else {
                s.append(cur)
                cur = char
                if count > 1 {
                    let countChars = Array(String(count))
                    s.append(contentsOf: countChars)
                    count = 1
                }
            }
        }
        s.append(cur)
        if count > 1 {
            let countChars = Array(String(count))
            s.append(contentsOf: countChars)
            count = 1
        } 
        chars = s
        return s.count
    }
}