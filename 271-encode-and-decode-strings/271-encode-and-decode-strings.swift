"""

[hello, world]

hello, world
"@"

"""
class Codec {
    func encode(_ strs: [String]) -> String {
        strs.joined(separator: "¡")
    }
    
    func decode(_ s: String) -> [String] {
        s.components(separatedBy: "¡")
    }
}

/**
 * Your Codec object will be instantiated and called as such:
 * let obj = Codec()
 * val s = obj.encode(strs)
 * let ans = obj.decode(s)
*/