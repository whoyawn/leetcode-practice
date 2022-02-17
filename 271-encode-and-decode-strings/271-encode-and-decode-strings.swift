"""
["Hello","World"]

"He##llo!#!Wor##!##!ld!!"

1. modify escaping chars
2. add delimiter (certain seq of chars)

O(n*m)
"""
class Codec {
    func encode(_ strs: [String]) -> String {
        strs
        .map { $0.replacingOccurrences(of: "#", with: "##") }
        .joined(separator: "!#!")
    }
    
    func decode(_ s: String) -> [String] {
        return s
        .components(separatedBy: "!#!")
        .map { $0.replacingOccurrences(of: "##", with: "#") }
    }
}

/**
 * Your Codec object will be instantiated and called as such:
 * let obj = Codec()
 * val s = obj.encode(strs)
 * let ans = obj.decode(s)
*/