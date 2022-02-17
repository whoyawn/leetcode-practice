"""
["Hello","World"]

"He##llo!#!Wor##!##!ld!!"

1. modify escaping chars
2. add delimiter (certain seq of chars)

O(n*m)

["Hello","World"]
5#Hello5#World

["8#Hell#o","World"]
8#8#Hello

["",""]
0#0#

123#
"""
class Codec {
    func encode(_ strs: [String]) -> String {
        // strs
        // .map { $0.replacingOccurrences(of: "#", with: "##") }
        // .joined(separator: "!#!")
        var encoded = ""
        for str in strs {
            encoded += String(str.count) + "#" + str
        }
        return encoded
    }
    //5#Hello5#World
    func decode(_ s: String) -> [String] {
        // return s
        // .components(separatedBy: "!#!")
        // .map { $0.replacingOccurrences(of: "##", with: "#") }
        var chars = Array(s)
        var decoded: [String] = []
        var i = 0
        var number = 0
        while i < chars.endIndex {
            if chars[i] != "#" {
                let digit = chars[i].wholeNumberValue!
                if digit == 0 {
                    decoded.append("")
                    i += 2
                } else {
                    while chars[i] != "#" {
                        number *= 10
                        number += chars[i].wholeNumberValue!
                        i += 1
                    }
                    decoded.append(String(chars[i+1..<i+1+number]))
                    i += number + 1
                    number = 0
                }
            }
        }
        return decoded
    }
}

/**
 * Your Codec object will be instantiated and called as such:
 * let obj = Codec()
 * val s = obj.encode(strs)
 * let ans = obj.decode(s)
*/